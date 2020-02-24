import 'dart:convert';

import 'package:github_api_testapp/data/networking/endpoints/commits/commits_endpoint.dart';
import 'package:github_api_testapp/data/networking/manager/commits/commits_get_manager.dart';
import 'package:github_api_testapp/data/networking/model/responses/commits/commits_response.dart';
import 'package:github_api_testapp/data/repository/commis_repository.dart';

import '../../messages.dart';

class CommitsRepositoryImpl implements CommitsRepository {
  CommitsGetManager manager;

  @override
  Future<CommitsResponseList> getRepoCommits(String userName, String repoName) async {
    var endpoint = CommitsEndpoint();
    manager = CommitsGetManager(endpoint:endpoint);
    String data = await manager.getReposCommit(userName, repoName);
    var jsonObject = jsonDecode(data);
    var response = CommitsResponseList.fromJson(jsonObject);
    if(response != null) {
      return response;
    } else {
      return Future.error(Messages.errorMessage);
    }
  }
  
}