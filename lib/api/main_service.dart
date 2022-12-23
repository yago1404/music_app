import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

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
      throw Exception('Invalid status code ${response.statusCode}');
    }
    return jsonDecode(response.body);
  }
}