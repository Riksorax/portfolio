using System.Text.Json.Serialization;
using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;
using Portfolio.Models;
using Portfolio.Services;

namespace Portfolio.Pages;

public partial class Home : ComponentBase, IDisposable
{
    [Inject]
    public IJSRuntime JsRuntime { get; set; } = null!;

    [Inject]
    public GitHubService GitHubService { get; set; } = null!;

    [Inject]
    public ILogger<Home> Logger { get; set; } = null!;


    // --- State for Projects Section ---
    private List<GitHubProject> _projects = [];
    private bool _isLoadingProjects = true;
    private string? _projectsErrorMessage;

    // --- State for Navbar ---
    private bool _isNavbarCollapsed = true;
    private string _activeNavLink = "home";
    private ElementReference _navbarCollapseElement;
    private ElementReference _navbarElement;


    // --- State for JS Interop ---
    // Referenz zum geladenen JavaScript-Modul (für Isolation)
    private IJSObjectReference? _module;
    // Referenz zum ScrollSpy-Handler innerhalb des Moduls
    private IJSObjectReference? _scrollSpyHandler;
    // DotNetObjectReference zum Aufrufen von C# aus JS
    private DotNetObjectReference<Home>? _dotNetHelper;
    private static readonly string[] Args = ["home", "about", "projects", "skills", "contact"];


    // --- Lifecycle Methods ---

    protected override async Task OnInitializedAsync()
    {
        await FetchGitHubProjects("Riksorax");
    }

    protected override async Task OnAfterRenderAsync(bool firstRender)
    {
        if (firstRender)
        {
            _dotNetHelper = DotNetObjectReference.Create(this);

            // --- Laden des isolierten JavaScript-Moduls ---
            // der Pfad ist ./_content/[YourAssemblyName]/[KomponentenPfad].razor.js
            // YourAssemblyName ist der Name Ihrer.csproj Datei (z.B. "Portfolio")
            // KomponentenPfad ist der Pfad ab dem Wurzelverzeichnis der Komponenten (z.B. "Pages/Home")
            const string modulePath = "./Pages/Home.razor.js";

            try
            {
                Logger.LogInformation($"Loading JS module from: {modulePath}"); // Optional
                _module = await JsRuntime.InvokeAsync<IJSObjectReference>("import", modulePath);
                Logger.LogInformation("JS module loaded successfully."); // Optional
            }
            catch (Exception ex)
            {
                Logger.LogError(ex, $"Fehler beim Laden des JS-Moduls von {modulePath}"); // Optional
                // Hier könnten Sie auch einen Fehler auf der Seite anzeigen, da JS Interop fehlschlägt
                 _projectsErrorMessage = "Konnte erforderliche JavaScript-Funktionen nicht laden."; // Beispiel
                 _isLoadingProjects = false; // Ladezustand beenden
                 StateHasChanged(); // UI aktualisieren
            }


            // --- Wenn Modul erfolgreich geladen wurde, seine exportierten Funktionen aufrufen ---
            if (_module != null)
            {
                 // Warten Sie, bis das Navbar-Element gerendert ist und erhalten Sie dessen Höhe
                var navbarHeight = 0;
                // Greifen Sie auf das DOM-Element über die ElementReference zu
                try
                {
                    // Rufen Sie die Funktion getElementBoundingClientRect INNERHALB des geladenen Moduls auf
                    // Verwenden Sie module.InvokeAsync, NICHT JsRuntime.InvokeAsync global
                    var rect = await _module.InvokeAsync<BoundingClientRect>("getElementBoundingClientRect", _navbarElement);
                    navbarHeight = (int)rect.Height;
                    Logger.LogInformation($"Navbar height obtained: {navbarHeight}"); // Optional
                }
                catch (Exception ex)
                {
                    Logger.LogError(ex, "Fehler beim Abrufen der Navbar-Höhe aus dem Modul."); // Optional
                    // Fallback oder Fehlerbehandlung, falls der Aufruf fehlschlägt
                }


                // Initialisieren Sie den Scroll-Spy INHALB des Moduls
                // Rufen Sie initScrollSpy INNERHALB des geladenen Moduls auf
                // Übergeben Sie die .NET Referenz und andere Daten
                // Verwenden Sie module. InvokeAsync, NICHT JsRuntime. InvokeAsync global
                _scrollSpyHandler = await _module.InvokeAsync<IJSObjectReference>("initScrollSpy", _dotNetHelper, Args, navbarHeight); // <-- Stellen Sie sicher, dass dies der Aufruf ist
                Logger.LogInformation("ScrollSpy initialized successfully."); // Optional


                // Aktualisieren Sie das Jahr im Footer über eine JS Interop (kann weiterhin global sein oder ins Modul verschoben werden)
                await JsRuntime.InvokeVoidAsync("eval", $"document.getElementById('year').textContent = new Date().getFullYear();");
            }
            else
            {
                 // Das Modul konnte nicht geladen werden. Behandeln Sie dies.
                 Logger.LogError("JS module is null, cannot initialize features relying on it."); // Optional
                 // Hier könnten Sie UI-Elemente deaktivieren oder eine Fehlermeldung anzeigen.
            }
        }
    }

     // Implementiert IDisposable, um den JS-Event-Listener und die DotNetObjectReference aufzuräumen
     public async void Dispose()
     {
         // Dispose des ScrollSpy-Handlers INNERHALB des Moduls
         // dies muss AUF dem Modul aufgerufen werden, wenn der Handler im Modul liegt
         if (_scrollSpyHandler != null)
         {
             try
             {
                 // Rufen Sie die Dispose-Methode im JS auf dem Handler-Objekt auf
                 await _scrollSpyHandler.InvokeVoidAsync("dispose");
                 // Entsorgen Sie die JS Objekt-Referenz
                 await _scrollSpyHandler.DisposeAsync();
                 Logger.LogInformation("ScrollSpy handler disposed."); // Optional
             }
             catch (JSDisconnectedException)
             {
                 /* Ignorieren, wenn die JS-Runtime bereits getrennt ist */
             }
             catch (Exception ex)
             {
                 Logger.LogError(ex, $"Fehler beim Entsorgen des ScrollSpy-Handlers.");
             }
         }

         // Entsorgen Sie die DotNetObjectReference
         _dotNetHelper?.Dispose();
         Logger.LogInformation("DotNetObjectReference disposed."); // Optional

         // Dispose des JS-Moduls selbst (optional, aber gute Praxis)
         if (_module == null) return;
         {
            try
            {
                await _module.DisposeAsync();
                Logger.LogInformation("JS module disposed."); // Optional
            }
            catch (JSDisconnectedException)
            {
                /* Ignorieren */
            }
            catch (Exception ex)
            {
                Logger.LogError(ex, $"Fehler beim Entsorgen des JS-Moduls.");
            }
        }
    }

    private async Task FetchGitHubProjects(string username)
    {
        _isLoadingProjects = true;
        _projectsErrorMessage = null;
        _projects.Clear();

        try
        {
            _projects = await GitHubService.GetPublicProjectsAsync(username);
        }
        catch (Exception ex)
        {
            _projectsErrorMessage = ex.Message;
            Logger.LogError(ex, "Fehler beim Abrufen der GitHub-Projekte."); // Optional
        }
        finally
        {
            _isLoadingProjects = false;
            StateHasChanged(); // UI aktualisieren
        }
    }

    private void ToggleNavbar()
    {
        _isNavbarCollapsed = !_isNavbarCollapsed;
    }

    // Wird durch @onclick="() => NavigateToSection(...)" in Home.razor ausgelöst
    private async Task NavigateToSection(string sectionId)
    {
        if (!_isNavbarCollapsed)
        {
            _isNavbarCollapsed = true;
        }

        _activeNavLink = sectionId;
        StateHasChanged(); // UI sofort aktualisieren

        // Rufen Sie die scrollToSection Funktion INNERHALB des geladenen Moduls auf
        // Verwenden Sie module. InvokeVoidAsync, NICHT JsRuntime. InvokeVoidAsync global
         if (_module != null) // Prüfen, ob Modul geladen wurde
         {
             var navbarHeight = 0;
             // Erneut die Höhe holen, idealerweise mit der Funktion aus dem Modul
             if (_navbarElement.Id != null)
             {
                 // Rufen Sie die Funktion getElementBoundingClientRect INNERHALB des geladenen Moduls auf
                 var rect = await _module.InvokeAsync<BoundingClientRect>("getElementBoundingClientRect", _navbarElement);
                 navbarHeight = (int)rect.Height;
             } else {
                 // Fallback-Aufruf, falls ElementReference fehlschlägt
                 navbarHeight = await JsRuntime.InvokeAsync<int>("eval", "document.querySelector('.navbar').offsetHeight");
             }

             // Rufen Sie die Funktion scrollToSection INNERHALB des geladenen Moduls auf
             await _module.InvokeVoidAsync("scrollToSection", sectionId, navbarHeight);
         } else {
             Logger.LogError("JS-Modul nicht geladen, kann nicht scrollen."); // Optional
             // Fallback: Standard-Link-Verhalten zulassen oder Fehlermeldung anzeigen
         }
    }

    // Diese Methode wird von JavaScript über [JSInvokable] aufgerufen
    [JSInvokable]
    public void SetActiveSection(string sectionId)
    {
        // Logik zum Aktualisieren des aktiven Links bleibt hier
        _activeNavLink = sectionId;
        StateHasChanged(); // UI aktualisieren
    }

     // --- JS Interop Helper DTO ---
     public class BoundingClientRect
     {
         [JsonPropertyName("height")]
         public double Height { get; init; }
     }
}