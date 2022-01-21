import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_calismasi/core/base/state/base_state.dart';
import 'package:mobx_calismasi/core/base/view/base_view.dart';
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
      onPageBuilder: (context, value) => const Text('Data'),
      viewModel: TestViewModel(),
    );
  }

  Widget get scaffoldBody => Scaffold(
        floatingActionButton: _floatingActionMethod,
        body: textNumber,
      );

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
