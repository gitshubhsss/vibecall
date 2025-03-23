import 'package:get/get.dart';
import 'package:vibe_call/core/common/widgets/common_snackbars/common_snackbar.dart';
import 'package:vibe_call/core/repository/custom_repository.dart';
import 'package:vibe_call/core/services/post_request_service.dart';

class PostRepository extends CustomRepository {
  @override
  Future<dynamic> postRepository({
    required String endPoint,
    required Map<String, dynamic> requestJson,
  }) async {
    try {
      final postservice = Get.find<PostRequestService>();
      var response = await postservice.postRequest(
        endpoint: endPoint,
        requestJson: requestJson,
      );
      var message = response.body['message'];
      if (response.statusCode == 200) {
        CommonSnackbar.successSnackbar(message);
        return response.body;
      } else {
        CommonSnackbar.failureSnackbar(message);
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
