import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const _baseUrl = "https://api.themoviedb.org/3";
  static const _apiKey = "52b1df5503c82fdf439449fa315add59";

  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, String>? params,
  }) async {
    final uri = Uri.parse(
      _baseUrl + path,
    ).replace(queryParameters: {"api_key": _apiKey, ...?params});

    final response = await http.get(uri);

    final body = jsonDecode(response.body);

    print("REQUEST URL: $uri");
    print("RESPONSE: $body");
    return body;
  }
}
