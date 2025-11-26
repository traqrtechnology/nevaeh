import 'dart:convert';
import 'package:http/http.dart' as http;

/// A simplified Ruby-like wrapper for JSON HTTP requests.
/// 
/// Usage:
/// ```dart
/// // Optional: Set global auth token
/// Json.bearerToken = 'my-secret-token';
/// 
/// // GET
/// var posts = await Json.get('https://api.example.com/posts');
/// 
/// // POST
/// var newPost = await Json.post('https://api.example.com/posts', {
///   'title': 'My Post',
///   'body': 'Content'
/// });
/// ```
class Json {
  /// Global Bearer token to be sent with every request.
  static String? bearerToken;

  /// Global base headers sent with every request.
  static Map<String, String> globalHeaders = {};

  /// Performs a GET request.
  /// Returns the decoded JSON body (Map or List).
  static Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    return _request('GET', url, headers: headers);
  }

  /// Performs a POST request.
  /// [body] is automatically encoded to JSON.
  static Future<dynamic> post(String url, [Object? body, Map<String, String>? headers]) async {
    return _request('POST', url, body: body, headers: headers);
  }

  /// Performs a PUT request.
  static Future<dynamic> put(String url, [Object? body, Map<String, String>? headers]) async {
    return _request('PUT', url, body: body, headers: headers);
  }

  /// Performs a PATCH request.
  static Future<dynamic> patch(String url, [Object? body, Map<String, String>? headers]) async {
    return _request('PATCH', url, body: body, headers: headers);
  }

  /// Performs a DELETE request.
  static Future<dynamic> delete(String url, {Map<String, String>? headers}) async {
    return _request('DELETE', url, headers: headers);
  }

  // Internal helper to handle the heavy lifting
  static Future<dynamic> _request(
    String method, 
    String url, {
    Object? body, 
    Map<String, String>? headers
  }) async {
    final uri = Uri.parse(url);
    
    // 1. Prepare Headers
    final requestHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      ...?globalHeaders, // Add global headers
      ...?headers,       // Add specific headers for this request
    };

    // 2. Add Bearer Token if it exists
    if (bearerToken != null && !requestHeaders.containsKey('Authorization')) {
      requestHeaders['Authorization'] = 'Bearer $bearerToken';
    }

    // 3. Send Request
    http.Response response;
    final bodyString = body != null ? jsonEncode(body) : null;

    try {
      switch (method) {
        case 'GET':
          response = await http.get(uri, headers: requestHeaders);
          break;
        case 'POST':
          response = await http.post(uri, headers: requestHeaders, body: bodyString);
          break;
        case 'PUT':
          response = await http.put(uri, headers: requestHeaders, body: bodyString);
          break;
        case 'PATCH':
          response = await http.patch(uri, headers: requestHeaders, body: bodyString);
          break;
        case 'DELETE':
          response = await http.delete(uri, headers: requestHeaders);
          break;
        default:
          throw Exception('Unsupported HTTP method: $method');
      }

      // 4. Handle Response
      if (response.statusCode >= 200 && response.statusCode < 300) {
        if (response.body.isEmpty) return null;
        try {
          return jsonDecode(response.body);
        } catch (e) {
          // If response is not valid JSON, return raw body or null
          return response.body; 
        }
      } else {
        throw HttpException(
          statusCode: response.statusCode, 
          message: response.body, 
          uri: uri
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}

class HttpException implements Exception {
  final int statusCode;
  final String message;
  final Uri uri;

  HttpException({
    required this.statusCode, 
    required this.message, 
    required this.uri
  });

  @override
  String toString() => 'HttpException [$statusCode] at $uri: $message';
}

/// Alias for [Json] to match user preference
typedef JsonAsync = Json;

