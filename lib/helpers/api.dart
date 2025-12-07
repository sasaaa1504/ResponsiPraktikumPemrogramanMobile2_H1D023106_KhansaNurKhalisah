import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user_info.dart';

class Api {
  // GET request
  static Future<http.Response> get(String url) async {
    final token = await UserInfo.getToken();

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      return response;
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // POST request
  static Future<http.Response> post(
    String url,
    Map<String, dynamic> data,
  ) async {
    final token = await UserInfo.getToken();

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(data),
      );
      return response;
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // PUT request
  static Future<http.Response> put(
    String url,
    Map<String, dynamic> data,
  ) async {
    final token = await UserInfo.getToken();

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(data),
      );
      return response;
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // DELETE request
  static Future<http.Response> delete(String url) async {
    final token = await UserInfo.getToken();

    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };

    try {
      final response = await http.delete(Uri.parse(url), headers: headers);
      return response;
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // Parse API response
  static Map<String, dynamic> parseResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      final errorBody = jsonDecode(response.body);
      throw Exception(errorBody['message'] ?? 'Unknown error occurred');
    }
  }
}
