import 'package:flutter/material.dart';
import 'package:mobx_calismasi/core/extension/string_extension.dart';

class LocaleText extends StatelessWidget {
  const LocaleText({Key? key, required this.value}) : super(key: key);
  final String value;
  @override
  Widget build(BuildContext context) {
    return Text(value.locale);
  }
}
