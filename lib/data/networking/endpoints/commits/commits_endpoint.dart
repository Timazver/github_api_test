import 'package:github_api_testapp/data/networking/service/endpoint_type.dart';
import 'package:github_api_testapp/data/networking/service/http_method.dart';

import '../base_endpoint.dart';

class CommitsEndpoint implements EndpointType {

  @override
  String baseUrl = BaseEndpoint.baseUrl;

  @override
  Map<String, String> httpHeaders = BaseEndpoint.httpHeaders;

  @override
  HttpMethod httpMethod = HttpMethod.get;

  @override
  Map<String, dynamic> httpParamteters = BaseEndpoint.httpParameters;

  @override
  String path = "/repos/userName/repoName/commits";
  
}