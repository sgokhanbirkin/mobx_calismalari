import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_calismasi/core/base/state/base_state.dart';
import 'package:mobx_calismasi/core/base/view/base_view.dart';
import 'package:mobx_calismasi/core/extension/string_extension.dart';
import 'package:mobx_calismasi/core/init/lang/language_manager.dart';
import 'package:mobx_calismasi/core/init/lang/locale_keys.g.dart';
import 'package:mobx_calismasi/features/authenticate/test/viewmodel/test_view_model.dart';

class TestsView extends StatefulWidget {
  const TestsView({Key? key}) : super(key: key);

  @override
  _TestsViewState createState() => _TestsViewState();
}

class _TestsViewState extends BaseState<TestsView> {
  late TestViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      onModelReady: (model) {
        viewModel = model;
      },
      onPageBuilder: (context, value) => scaffoldBody,
      viewModel: TestViewModel(),
    );
  }

  Widget get scaffoldBody => Scaffold(
        appBar: AppBar(
          title: _textWelcomeWidget,
          actions: [_iconButtonTurn],
        ),
        floatingActionButton: _floatingActionMethod,
        body: textNumber,
      );

  Text get _textWelcomeWidget {
    return Text(LocaleKeys.welcome.locale);
  }

  IconButton get _iconButtonTurn {
    return IconButton(
      onPressed: () {
        //context.locale = LanguageManager.instance.enLocale;
        context.setLocale(LanguageManager.instance.enLocale);
      },
      icon: const Icon(Icons.change_history),
    );
  }

  FloatingActionButton get _floatingActionMethod {
    return FloatingActionButton(
      onPressed: () => viewModel.incrementNumber(),
    );
  }

  Widget get textNumber {
    return Observer(
      builder: (context) => Text(
        viewModel.number.toString(),
      ),
    );
  }
}
