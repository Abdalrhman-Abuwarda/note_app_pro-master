import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'handelException.dart';

class BaseClient {
  BaseClient._();
  int timeout = 10;
  static BaseClient baseClient = BaseClient._();


  Future<dynamic> get(String url, Map<String, String> headers) async {
      http.Response response = await http.get(Uri.parse(url), headers: headers);
        return response;
    }


  Future<dynamic> post(String url,
      {Map<String, String>? headers,
       required dynamic body}) async {
     http.Response response = await http
        .post(Uri.parse(url), headers: headers, body: body)
        .timeout(Duration(seconds: timeout));
    return response;

  }


  Future<dynamic> delete(String url, Map<String, String> headers) async {
    Uri uri = Uri.parse(url);

      http.Response response = await http.delete(uri, headers: headers);
      print(response.statusCode);
      print(response.body);
        return response;

  }


  Future<dynamic> put(String url, {required Map<String, String> headers,required Map<String, String> body}) async {
      http.Response response = await http.put(Uri.parse(url), headers: headers, body: body);
      print(response.body);
        return response;
  }

}
