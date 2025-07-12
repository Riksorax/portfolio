using System.Text.Json.Serialization;

namespace Portfolio.Models;

public class GitHubRepositoryDto
{
    [JsonPropertyName("name")]
    public string Name { get; set; } = string.Empty; // Standardwert, um Null-Referenzen zu vermeiden

    [JsonPropertyName("description")]
    public string? Description { get; set; } // Kann null sein

    [JsonPropertyName("html_url")]
    public string HtmlUrl { get; set; } = string.Empty; // URL zum Repository

    [JsonPropertyName("language")]
    public string? Language { get; set; } // Primäre Sprache (kann null sein)

    [JsonPropertyName("topics")]
    public List<string>? Topics { get; set; } // Themen/Tags (kann null sein)

    // Fügen Sie hier weitere Eigenschaften aus der API hinzu, falls benötigt (z.B. stargazers_count, created_at, updated_at)
    // [JsonPropertyName("stargazers_count")]
    // public int StargazersCount { get; set; }

    // [JsonPropertyName("updated_at")]
    // public DateTime UpdatedAt { get; set; }
}