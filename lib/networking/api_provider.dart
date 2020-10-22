import 'package:flutter/cupertino.dart';

import 'custom_exception.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class ApiProvider {
  final String _baseUrl = "meetup.rikkei.org";

  Map<String, String> queryParameters;

  ApiProvider({@required this.queryParameters});

  Future<String> get(String url) async {
    var responseJson;
    try {
      var uri = Uri.http(_baseUrl, url, queryParameters);
      print(uri);
      final response = await http.get(uri);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<String> post(String url) async {
    var responseJson;
    try {
      var uri = Uri.http(_baseUrl, url, queryParameters);
      print(uri);
      final response = await http.post(uri);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
