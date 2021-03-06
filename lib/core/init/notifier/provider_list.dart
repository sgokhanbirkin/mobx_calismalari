import 'package:mobx_calismasi/core/init/navigation/navigation_service.dart';
import 'package:mobx_calismasi/core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ApplicationProvider {
  static final ApplicationProvider _instance = ApplicationProvider._init();
  static ApplicationProvider get instance {
    return _instance;
  }

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];

  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(create: (context) => ThemeNotifier()),
    Provider.value(
      value: NavigationService.instance,
    ),
  ];

  List<SingleChildWidget> uiChangesItems = [];
}
