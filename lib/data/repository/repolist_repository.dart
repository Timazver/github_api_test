import 'package:github_api_testapp/data/networking/model/responses/repos/repolist_response.dart';

abstract class RepolistRepository {

  Future<RepolistResponse> getUserRepos(String userName);
}