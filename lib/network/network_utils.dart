import 'package:get/get_connect/connect.dart';

class NetworkUtils {
  static Response handelSocketException() {
    return Response(
      statusCode: 503,
      body: {"message": "No internet connection"},
    );
  }

  static Response handleGenericException(dynamic e) {
    return Response(statusCode: 500, body: {"message": "$e"});
  }
}
