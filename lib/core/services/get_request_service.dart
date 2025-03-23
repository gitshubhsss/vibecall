import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/connect.dart';
import 'package:vibe_call/core/network/api_client.dart';
import 'package:vibe_call/core/network/network_utils.dart';

class GetRequestService {
  final ApiClient _apiClient;
  GetRequestService(this._apiClient); // Use Dependency Injection (DI)
  Future<Response> getRequest(String endpoint) async {
    try {
      final headers = await _apiClient.getHeaders(); // Fetch headers
      debugPrint("GET Request to: $endpoint with headers: $headers");
      final response = await _apiClient.client.get(endpoint); // Use `client`
      debugPrint("${response.statusCode}");
      debugPrint('statuscode');
      debugPrint("${response.body}");
      if (response.statusCode == 200) {
        return response;
      } else {
        return Response(
          statusCode: response.statusCode,
          body: {"message": "${response.body["message"]}"},
        );
      }
    } on SocketException {
      return NetworkUtils.handelSocketException();
    } catch (e) {
      return NetworkUtils.handleGenericException(e);
    }
  }
}
