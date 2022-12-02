import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Constants.dart';

enum UiDesignItems {
  table,
  card,
}

class Utils {
  static Future<http.Response> getApiCall(String url) {
    Constants.headers['token'] = Constants.user_token;
    return http.get(Uri.parse(url), headers: Constants.headers);
  }
  static Future<http.Response> postApiCall(String url, var body) {
    var dt = jsonEncode(body);
    print(dt);
    Constants.headers['token'] = Constants.user_token;
    return http.post(Uri.parse(url), headers: Constants.headers, body: dt);
  }

    void showInSnackBar(
      String message, GlobalKey<ScaffoldState> _scaffoldKey, bool isSuccess) {
    _scaffoldKey.currentState!.showSnackBar(
      new SnackBar(
        content: new Text(
          message,
          style: TextStyle(color: isSuccess ? Colors.grey : Colors.red),
        ),
      ),
    );
  }
}
