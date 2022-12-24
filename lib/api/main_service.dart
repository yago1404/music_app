import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/api/models/exceptions/api_exception.dart';

class MainService {

  const MainService(BuildContext context);

  Future<Map<String, dynamic>> get(String route) async {
    return {};
  }

  Future<Map<String, dynamic>> post(String route, {Map<String, dynamic>? data}) async {
    return {};
  }

  Future<Map<String, dynamic>> put(String route, {Map<String, dynamic>? data}) async {
    return {};
  }

  Future<Map<String, dynamic>> delete(String route, {Map<String, dynamic>? data}) async {
    return {};
  }

  Future<Map<String, dynamic>> _validateResponse(http.Response response) async {
    if (response.statusCode > 399) {
      throw ApiException(
        message: 'Invalid status code ${response.statusCode}',
        statusCode: response.statusCode,
      );
    }
    return jsonDecode(response.body);
  }
}