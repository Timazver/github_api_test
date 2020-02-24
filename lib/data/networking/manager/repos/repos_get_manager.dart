import 'package:github_api_testapp/messages.dart';
import 'package:github_api_testapp/data/networking/service/endpoint_type.dart';
import 'package:http/http.dart';

class ReposGetManager {
  EndpointType endpoint;

  ReposGetManager({this.endpoint});

  Future <dynamic> getUserRepos(String userName) async {
    String url = "${endpoint.baseUrl}${endpoint.path.replaceAll("userName", userName)}";
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