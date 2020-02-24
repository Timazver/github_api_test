import 'package:github_api_testapp/data/networking/model/responses/commits/commits_response.dart';

abstract class CommitsRepository {
  Future<CommitsResponseList> getRepoCommits(String userName, String repoName);
}