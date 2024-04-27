import 'package:flutter/material.dart';
import 'package:flutter_test_app/presentation/dialogs/error_dialog.dart';

void showErrorDialog(
  BuildContext context, {
  required String? error,
}) {
  showDialog(
    context: context,
    builder: (_) => ErrorDialog(error),
  );
}
