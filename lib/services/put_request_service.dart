import 'dart:io';

import 'package:get/get_connect/connect.dart';
import 'package:vibe_call/network/api_client.dart';
import 'package:vibe_call/network/network_utils.dart';

class PutRequestService {
  final ApiClient _apiClient;
  PutRequestService(this._apiClient); //Dependacy injection
  Future<Response> putRequest({
    required String endpoint,
    required Map<String, dynamic> requestJson,
  }) async {
    final headers = await _apiClient.getHeaders();
    try {
      final response = await _apiClient.client.put(
        endpoint,
        requestJson,
        headers: headers,
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
