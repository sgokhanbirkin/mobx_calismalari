import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx_calismasi/core/constants/app/app_constant.dart';
import 'package:mobx_calismasi/core/init/cache/locale_manager.dart';
import 'package:mobx_calismasi/core/init/lang/language_manager.dart';
import 'package:mobx_calismasi/core/init/navigation/navigation_route.dart';
import 'package:mobx_calismasi/core/init/navigation/navigation_service.dart';
import 'package:mobx_calismasi/core/init/notifier/provider_list.dart';
import 'package:mobx_calismasi/core/init/notifier/theme_notifier.dart';
import 'package:mobx_calismasi/features/authenticate/test/view/text_view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleManager.preferencesInit();

  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: EasyLocalization(
      child: const MyApp(),
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: ApplicationConstants.LANG_ASSET_PATH,
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeNotifier>(context, listen: false).currentTheme,
      home: const TestsView(),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
