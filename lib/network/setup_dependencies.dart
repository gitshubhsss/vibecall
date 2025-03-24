import 'package:get/get.dart';
import 'package:vibe_call/network/api_client.dart';
import 'package:vibe_call/services/delete_request_service.dart';
import 'package:vibe_call/services/get_request_service.dart';
import 'package:vibe_call/services/post_request_service.dart';
import 'package:vibe_call/services/put_request_service.dart';

class SetupDependencies {
  static void init() {
    Get.put<ApiClient>(ApiClient(), permanent: true); // Use singleton
    Get.lazyPut<GetRequestService>(() => GetRequestService(Get.find()));
    Get.lazyPut<PostRequestService>(() => PostRequestService(Get.find()));
    Get.lazyPut<PutRequestService>(() => PutRequestService(Get.find()));
    Get.lazyPut<DeleteRequestService>(() => DeleteRequestService(Get.find()));
  }
}
