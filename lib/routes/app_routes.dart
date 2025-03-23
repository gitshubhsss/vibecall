import 'package:get/get_navigation/get_navigation.dart';
import 'package:vibe_call/features/auth/domain/bindings/home_controller_binding.dart';
import 'package:vibe_call/features/auth/presentation/pages/home_page.dart';

class AppRoutes {
  static const String homeScreen = "/home";

  List<GetPage> routes = [
    GetPage(
      name: homeScreen,
      page: () => HomePage(),
      binding: HomeControllerBindinge(),
    ),
  ];
}
