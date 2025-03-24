class CustomRepository {
  Future<dynamic> getRepository({required String endPoint}) async {}
  Future<dynamic> postRepository({
    required String endPoint,
    required Map<String, dynamic> requestJson,
  }) async {}

  Future<dynamic> putRepository({
    required String endPoint,
    required Map<String, dynamic> requestJson,
  }) async {}

  Future<dynamic> deleteRepository({
    required String endPoint,
    required Map<String, dynamic> requestJson,
  }) async {}
}
