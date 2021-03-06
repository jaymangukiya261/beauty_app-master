import 'package:beauty_app/view/base_page/view/base_page_view.dart';
import 'package:beauty_app/view/product_detail/view/product_detail_view.dart';

import 'view/home/view/home_view.dart';
import 'view/products/view/products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'core/base/binding/base_bindings.dart';
import 'core/init/cache/locale_manager.dart';
import 'core/init/routes/app_pages.dart';
import 'core/init/theme/app_theme_light.dart';
import 'core/init/translate/app_translations.dart';

void main() async {
  await asyncInit();
  runApp(const StartApp());
}

class StartApp extends StatelessWidget {
  const StartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowMaterialGrid: false,
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.native,
          initialBinding: BaseBinding(),
          title: 'favrea',
          getPages: AppPages.pages,
          translationsKeys: AppTranslation.translations,
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('en', 'US'),
          theme: AppThemeLight.instance.theme,
          smartManagement: SmartManagement.full,
          home: BasePageView(),
        );
      },
    );
  }
}

Future<void> asyncInit() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.prefrencesInit();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  //close keyboard
  SystemChannels.textInput.invokeMethod('TextInput.hide');
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.grey[200],
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.black,
  ));
}
