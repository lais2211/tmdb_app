import 'package:flutter/material.dart';

MaterialApp defaultStructure(Widget widget, {bool withScaffold = true}) {
  return MaterialApp(
    builder: (BuildContext context, Widget? child) =>
        withScaffold ? Scaffold(body: widget) : widget,
  );
}
