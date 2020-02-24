class CommitsResponse {
  String sha;
  Commit commit;
  CommitAuthor author;

  CommitsResponse({this.sha, this.commit, this.author});

  factory CommitsResponse.fromJson(Map<String, dynamic> json) {
    return CommitsResponse(
      sha: json["sha"],
      commit: Commit.fromJson(json["commit"]),
      author: CommitAuthor.fromJson(json["author"])
    );
  }
}

class Commit {
  String message;

  Commit({this.message});

  factory Commit.fromJson(Map<String, dynamic> json) {
    return Commit(
      message: json["message"]
    );
  }
}

class CommitAuthor {
  String login;
  String avatarUrl;

  CommitAuthor({this.login, this.avatarUrl});

  factory CommitAuthor.fromJson(Map<String, dynamic> json) {
    return CommitAuthor(
      avatarUrl: json["avatar_url"] ?? "",
      login: json["login"]
    );
  }
}

class CommitsResponseList {
  List<CommitsResponse> commits;

  CommitsResponseList({this.commits});

  factory CommitsResponseList.fromJson(List<dynamic> list) {
    return CommitsResponseList(commits: list.map((item) => CommitsResponse.fromJson(item)).toList());
  }
}