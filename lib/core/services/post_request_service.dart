import 'dart:io';
import 'package:get/get_connect/connect.dart';
import 'package:vibe_call/core/network/api_client.dart';
import 'package:vibe_call/core/network/network_utils.dart';

class PostRequestService {
  final ApiClient _apiClient;
  PostRequestService(this._apiClient);
  Future<Response> postRequest({
    required String endpoint,
    required Map<String, dynamic> requestJson,
  }) async {
    try {
      final headers = await _apiClient.getHeaders();
      final response = await _apiClient.client.post(
        endpoint,
        requestJson,
        headers: headers,
      );
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
