import 'package:github_api_testapp/messages.dart';
import 'package:github_api_testapp/data/networking/service/endpoint_type.dart';
import 'package:http/http.dart';

class CommitsGetManager {
  EndpointType endpoint;

  CommitsGetManager({this.endpoint});

  Future <dynamic> getReposCommit(String userName, String repoName) async {
    String url = "${endpoint.baseUrl}${endpoint.path.replaceAll("userName", userName).replaceAll("repoName", repoName)}";
    print(url);
    var response = await get(url);
    print(response.body);
    if(response.statusCode == 200) {
      return response.body;
    } else {
      return Future.error(Messages.errorMessage);
    }
  }
}