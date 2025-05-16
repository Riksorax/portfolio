namespace Portfolio.Models;

public class GitHubProject
{
    public string Name { get; set; } = string.Empty;
    public string? Description { get; set; }
    public string HtmlUrl { get; set; } = string.Empty;
    public string? PrimaryLanguage { get; set; } // Primäre Sprache
    public List<string>? Topics { get; set; } // Themen/Tags

    // Hier könnten Sie auch Properties für den manuellen/Demo-Status einfügen, falls gewünscht:
    // public string Status { get; set; } = "Unknown";
    // public string StatusClass { get; set; } = "status-warning";
}