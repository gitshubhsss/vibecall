import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibe_call/core/common/widgets/common_snackbars/common_snackbar.dart';
import 'package:vibe_call/repository/custom_repository.dart';
import 'package:vibe_call/services/get_request_service.dart';

class GetRequestRepository extends CustomRepository {
  @override
  Future<dynamic> getRepository({required String endPoint}) async {
    try {
      //TODO::Show loader
      final getRequestService = Get.find<GetRequestService>();
      debugPrint("$getRequestService");
      final response = await getRequestService.getRequest(endPoint);
      if (response.statusCode == 200) {
        CommonSnackbar.successSnackbar("success");
        //TODO::Hide loader
        return response.body;
      } else {
        //TODO::hide loader
        CommonSnackbar.failureSnackbar("error");
        return null;
      }
    } catch (e) {
      //TODO::hide loader
      return null;
    }
  }
}
