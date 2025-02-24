import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:re_align/constants/constants.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() async{
 WidgetsFlutterBinding.ensureInitialized();
  await initialization();
  runApp(const MyApp());
}

Future initialization() async {
  await GetStorage.init(AppStrings.THEME_BOX_KEY);
  // await GetStorage.init().then((value) async {
  // });
}

class MyApp extends StatelessWidget {
  // ignore: use_super_parameters
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: Get.key,
      debugShowCheckedModeBanner: false,
      title: AppStrings.APP_NAME,
      themeMode: ThemeMode.light,
      builder: (context, widget) {
        return AnimatedTheme(
          data:ThemeData(),
          child: ResponsiveWrapper.builder(
            MediaQuery(
              // prevent font from scaling (some people use big/small device fonts)
              // but we want our app font to still the same and don't get affected..
              data: MediaQuery.of(context)
                  .copyWith(textScaler: const TextScaler.linear(1.0)),
              child: BouncingScrollWrapper.builder(context, widget!),
            ),
            defaultScale: true,
            breakpoints: const [
              ResponsiveBreakpoint.resize(600, name: MOBILE),
              ResponsiveBreakpoint.resize(650, name: TABLET),
              ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
          ),
        );
      },
      initialRoute: AppRoutes.LOGIN,
      getPages: AppPages.pages,
      defaultTransition: Transition.cupertino,
      smartManagement: SmartManagement.full,
    );
  }
}
