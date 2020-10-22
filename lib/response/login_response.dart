import 'package:flutter/cupertino.dart';

import '../networking/api_provider.dart';
import 'dart:async';
import 'dart:convert';
import '../models/login_model.dart';

class LoginRepository {

  ApiProvider _provider;

  Map<String, String> params;

  LoginRepository({@required this.params}) {
    _provider = ApiProvider(queryParameters: params);
  }

  LoginModel parseProducts(String responseBody) {
    final parsed = jsonDecode(responseBody);
    var userLogin = LoginModel.fromJson(parsed);
    return userLogin;
  }

  Future<LoginModel> login() async {
    final responseBody = await _provider.post("api/v0/login");
    return parseProducts(responseBody);
  }
}
