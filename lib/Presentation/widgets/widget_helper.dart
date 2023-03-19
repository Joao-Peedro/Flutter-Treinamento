import 'package:flutter/material.dart';

class WidgetHelper {
  static void showError(BuildContext context, String errorMessage) {
    _onWidgetDidBuild(() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          errorMessage,
          key: const Key('error-snack'),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
      ));
    });
  }

  static void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}
