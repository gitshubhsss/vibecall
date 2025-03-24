import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:vibe_call/repository/get_request_repository.dart';
import 'package:vibe_call/features/auth/data/models/user_model.dart';

class HomePageController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await fetchUser();
  }

  User? user;
  Future<void> fetchUser() async {
    var data = await GetRequestRepository().getRepository(endPoint: "");
    if (data != null) {
      user = User.jsonData(json: data);
      update();
      debugPrint('$data');
      debugPrint("printing the parsed data");
      // debugPrint('${user!.toJson()}');
    } else {
      debugPrint("data is null");
    }
  }
}
