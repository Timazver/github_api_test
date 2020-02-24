import 'dart:convert';
import 'package:github_api_testapp/messages.dart';
import 'package:github_api_testapp/data/networking/endpoints/repos/repolist_endpoint.dart';
import 'package:github_api_testapp/data/networking/manager/repos/repos_get_manager.dart';
import 'package:github_api_testapp/data/networking/model/responses/repos/repolist_response.dart';
import 'package:github_api_testapp/data/repository/repolist_repository.dart';

class RepolistRepositoryImpl implements RepolistRepository {
  ReposGetManager manager;

  @override
  Future<RepolistResponse> getUserRepos(String userName) async {
    var endpoint = RepolistEndpoint();
    manager = ReposGetManager(endpoint:endpoint);
    String data = await manager.getUserRepos(userName);
    var jsonObject = jsonDecode(data);
    var response = RepolistResponse.fromJson(jsonObject);
    if(response != null) {
      return response;
    } else {
      return Future.error(Messages.errorMessage);
    }
  }
  
}