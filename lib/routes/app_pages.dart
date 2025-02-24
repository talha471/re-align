import 'package:get/get.dart';
import 'package:re_align/routes/app_routes.dart';
import 'package:re_align/views/authentication/welcome_screen.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.WELCOMESCREEN,
      page: () => const WelcomeScreen(),
    ),
    
  ];
}
