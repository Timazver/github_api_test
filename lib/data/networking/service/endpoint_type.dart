import 'dart:core';
import 'package:github_api_testapp/data/networking/service/http_method.dart';

abstract class EndpointType {
  String baseUrl;
  String path;
  HttpMethod httpMethod;
  Map<String,String> httpHeaders;
  Map<String,dynamic> httpParamteters;
}