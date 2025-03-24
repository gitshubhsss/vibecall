import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ApiClient {
  static final ApiClient _instance =
      ApiClient._internal(); // Singleton instance

  factory ApiClient() =>
      _instance; // Factory constructor returns the same instance

  final GetConnect client = GetConnect();

  ApiClient._internal() {
    // Private constructor
    if (kReleaseMode) {
      client.httpClient.baseUrl = 'https://randomuser.me/api/';
    } else if (kDebugMode) {
      client.httpClient.baseUrl = 'https://randomuser.me/api/';
    }
  }

  Future<String> getToken() async {
    return "your_access_token"; // Replace with actual token logic
  }

  Future<Map<String, String>> getHeaders() async {
    String token = await getToken();
    return {
      "Authorization": "Bearer $token",
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
  }
}
