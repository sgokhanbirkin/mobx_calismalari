import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_calismasi/core/constants/enums/app_theme_enum.dart';
import 'package:mobx_calismasi/core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';
part 'test_view_model.g.dart';

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store {
  late BuildContext context;
  @observable
  int number = 0;

  void setContext(BuildContext context) {
    this.context = context;
  }

  @computed
  bool get isEven => number % 2 == 0;

  @action
  void incrementNumber() {
    number++;
  }

  void changeTheme() {
    Provider.of<ThemeNotifier>(context, listen: false)
        .changeValue(AppThemes.DARK);
  }
}
