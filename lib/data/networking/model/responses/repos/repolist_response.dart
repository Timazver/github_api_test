
class RepolistResponse {
  List<Repo> repos;

  RepolistResponse({this.repos});

  factory RepolistResponse.fromJson(List json) {
    return RepolistResponse(repos: json.map((item) => Repo.fromJson(item)).toList());
  }
}

class Repo {
  final int id;
  final String name;
  final String description;
  final int stargazersCount;
  final RepoOwner repoOwner;

  Repo({this.id, this.name, this.description, this.repoOwner,this.stargazersCount});

  factory Repo.fromJson(Map<String, dynamic> json) {
    return Repo(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      description: json["description"] ?? "No Description",
      repoOwner: RepoOwner.fromJson(json["owner"]),
      stargazersCount: json["stargazers_count"] ?? 0
    );
  }

}
class RepoOwner {
  final String avatarUrl;
  final String login;
  

  RepoOwner({this.avatarUrl, this.login});

  factory RepoOwner.fromJson(Map<String, dynamic> json) {
    return RepoOwner(
      avatarUrl: json["avatar_url"] ?? "",
      login: json["login"] ?? ""
    );
  }
}