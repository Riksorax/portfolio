// Interface für das disposable Objekt, das vom ScrollSpy zurückgegeben wird.
interface Disposable {
    dispose(): void;
}

// Interface für das BoundingClientRect Objekt.
interface BoundingClientRect {
    height: number;
}

/**
 * Temporäre Debugging-Version 3: Initialisiert den Scroll-Spy OHNE Event-Listener.
 * RUFT DEN HANDLER NUR EINMAL INITIAL AUF. Loggt Parameter beim Eintritt.
 * @param sectionIds - Erwartet Array von IDs.
 * @param navbarHeight - Erwartet Zahl.
 * @param dotNetHelper - Erwartet Zahl.
 * @returns Ein Dummy-Disposable-Objekt oder null.
 */
// Behalten Sie die Signatur der Test Version 2 bei (2 Parameter)
export function initScrollSpy(dotNetHelper: any, sectionIds: string[], navbarHeight: number): Disposable | null {
    
    // <-- HIER TRITT DER FEHLER 'sectionIds.map is not a function' AUF, WENN sectionIds KEIN ARRAY IST -->
    const sections: HTMLElement[] = sectionIds
        .map(id => document.getElementById(id))
        .filter((el): el is HTMLElement => el != null);

    if (sections.length === 0) {
        console.warn("ScrollSpy: Keine Sektionen für die gegebenen IDs gefunden."); // Behalte den Warn-Log
        return null;
    }

    // Die scrollHandler Funktion bleibt gleich (ohne dotNetHelper Aufruf)
    const scrollHandler = () => {
        let currentSectionId: string | null = null;
        const scrollY: number = window.scrollY;
        
        // ... Der Rest der scrollHandler Logik (Berechnung der aktiven Sektion, ohne dotNetHelper Aufruf) bleibt gleich ...
        for (let i = sections.length - 1; i >= 0; i--) {
            const section = sections[i];
            if (section && section.offsetHeight > 0) {
                // Verwenden Sie hier die korrekten Parameter aus der Funktionssignatur
                const sectionTop: number = section.offsetTop - navbarHeight - 1;

                if (scrollY >= sectionTop) {
                    currentSectionId = section.getAttribute('id');
                    break;
                }
            }
        }

        if (!currentSectionId && sections.length > 0) {
            currentSectionId = sections[0].getAttribute('id');
        }

        if (currentSectionId !== null) {
            // Überprüfen Sie, ob dotNetHelper verfügbar ist (sicherheitshalber)
            if (dotNetHelper && dotNetHelper.invokeMethodAsync) {
                // Rufe die C# Methode SetActiveSection auf und übergebe die Sektions-ID
                dotNetHelper.invokeMethodAsync('SetActiveSection', currentSectionId)
                    .catch((error: any) => {
                        console.error("Fehler beim Aufrufen von SetActiveSection:", error);
                    });
            } else {
                console.warn("DotNet Helper ist nicht verfügbar...");
            }
        }
    };

    // Event Listener registrieren
    window.addEventListener("scroll", scrollHandler);
    
    // RUFT DEN HANDLER NUR EINMAL SOFORT AUF (KEIN EVENT-LISTENER REGISTRIERT)
    scrollHandler();
    
    // Gibt ein Dummy Disposable Objekt zurück
    return {
        dispose: () => {
            window.removeEventListener("scroll", scrollHandler);
        }
    };
}

/**
 * Scrollt das Fenster sanft zu einer Zielsektion. DIESE FUNKTION WIRD EXPORTIERT.
 * @param sectionId - Die ID der Sektion.
 * @param navbarHeight - Die Höhe der Navbar.
 */
export function scrollToSection(sectionId: string, navbarHeight: number): void {
    const targetElement = document.getElementById(sectionId);
    if (targetElement) {
        window.scrollTo({
            top: targetElement.offsetTop - navbarHeight,
            behavior: 'smooth'
        });
    }
}

/**
 * Holt das Bounding Client Rectangle eines Elements. DIESE FUNKTION WIRD EXPORTIERT.
 * @param element - Das HTML-Element.
 * @returns Das BoundingClientRect oder null.
 */
export function getElementBoundingClientRect(element: HTMLElement | null | undefined): BoundingClientRect | null {
    if (element) {
        const rect = element.getBoundingClientRect();
        return {
            height: rect.height
        };
    }
    return null;
}