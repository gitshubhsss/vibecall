import 'dart:io';

import 'package:get/get_connect/connect.dart';
import 'package:vibe_call/network/api_client.dart';
import 'package:vibe_call/network/network_utils.dart';

class DeleteRequestService {
  final ApiClient _apiClient;
  DeleteRequestService(this._apiClient);
  Future<Response> deleteRequest({
    required String endpoint,
    required Map<String, dynamic> requestJson,
  }) async {
    try {
      final headers = await _apiClient.getHeaders();
      final response = await _apiClient.client.delete(
        endpoint,
        headers: headers,
        query: requestJson,
      );
      if (response.statusCode == 200) {
        return response;
      } else {
        return Response(
          statusCode: response.statusCode,
          body: {"message": "${response.body['message']}"},
        );
      }
    } on SocketException {
      return NetworkUtils.handelSocketException();
    } catch (e) {
      return NetworkUtils.handleGenericException(e);
    }
  }
}
