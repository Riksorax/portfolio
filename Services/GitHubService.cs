using System.Net.Http.Json;
using Portfolio.Models;

namespace Portfolio.Services;

public class GitHubService
{
    private readonly HttpClient _httpClient;
    private readonly ILogger<GitHubService> _logger; // Optional: Logger injizieren

    // HttpClient (und optional Logger) per Dependency Injection injizieren
    public GitHubService(HttpClient httpClient, ILogger<GitHubService> logger) // Optional: Logger Parameter hinzufügen
    {
        _httpClient = httpClient;
        _logger = logger; // Optional: Logger zuweisen

        // GitHub API erfordert einen User-Agent Header
        // es ist Best Practice, dies hier im Dienst zu konfigurieren
         if (!_httpClient.DefaultRequestHeaders.Contains("User-Agent"))
         {
             _httpClient.DefaultRequestHeaders.UserAgent.ParseAdd("Blazor-Portfolio-App/1.0 (contact@your-domain.com)");
         }

        // Optional: BaseAddress setzen, wenn HttpClient speziell für GitHub ist.
        // Standardmäßig hat der von Blazor injizierte HttpClient die App-BaseAddress.
        // Wenn das so bleibt, müssen Sie bei GetFromJsonAsync absolute URLs verwenden.
        // Wenn Sie hier BaseAddress setzen, brauchen Sie einen separaten, benannten HttpClient
        // oder Sie prüfen die BaseAddress vor dem Setzen.
        // Für dieses Beispiel verwenden wir absolute URLs im GetFromJsonAsync Aufruf.
    }

    // Methode zum Abrufen öffentlicher Projekte für einen bestimmten Benutzer
    public async Task<List<GitHubProject>> GetPublicProjectsAsync(string username)
    {
        try
        {
            _logger.LogInformation($"Fetching GitHub repos for user: {username}"); // Optional

            var apiUrl = $"https://api.github.com/users/{username}/repos?type=public&sort=updated&per_page=100";

            // GetFromJsonAsync führt den API-Aufruf durch und deserialisiert die Antwort
            var reposDto = await _httpClient.GetFromJsonAsync<List<GitHubRepositoryDto>>(apiUrl);

            if (reposDto == null)
            {
                 _logger.LogWarning($"GitHub API returned null or empty list for user: {username}"); // Optional
                 return new List<GitHubProject>(); // Leere Liste bei Null-Antwort
            }

            // Mapping von DTO zu unserem internen Modell
            var projects = reposDto
                .Select(repo => new GitHubProject
                {
                    Name = repo.Name,
                    Description = repo.Description,
                    HtmlUrl = repo.HtmlUrl,
                    PrimaryLanguage = repo.Language,
                    Topics = repo.Topics
                    // Hier ggf. manuellen Status zuweisen, falls im Modell vorhanden
                    // Status = "Demo Status",
                    // StatusClass = "status-warning"
                })
                // Optional: Filtern von Repositories (z.B. Forks, bestimmte Namen)
                // .Where(p => !p.Name.EndsWith("-template")) // Beispiel
                .ToList();

            _logger.LogInformation($"Successfully fetched {projects.Count} GitHub repos for user: {username}"); // Optional
            return projects;
        }
        catch (HttpRequestException httpEx)
        {
             _logger.LogError(httpEx, $"HTTP request failed in GitHubService for user {username}"); // Optional
            // Fehler werfen, damit die Komponente ihn behandeln kann
            throw new Exception($"Konnte Projekte von GitHub nicht abrufen (Netzwerk/API Fehler): {httpEx.Message}", httpEx);
        }
        catch (Exception ex)
        {
             _logger.LogError(ex, $"An unexpected error occurred in GitHubService for user {username}"); // Optional
            // Andere Fehler werfen
            throw new Exception($"Ein unerwarteter Fehler ist beim Verarbeiten der GitHub-Daten aufgetreten: {ex.Message}", ex);
        }
    }
}