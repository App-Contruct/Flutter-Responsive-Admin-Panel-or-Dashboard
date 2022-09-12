import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

class CustomDialog {
  static ProgressDialog instance(
      {required BuildContext context,
      required String message,
      Color color = Colors.black}) {
    FocusScope.of(context).requestFocus(FocusNode());
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    final ProgressDialog dialog = ProgressDialog(context,
        dismissable: false,
        backgroundColor: Colors.grey.shade900.withOpacity(0.8),
        title: const Text('Aguarde!'),
        message: Text(message));
    return dialog;
  }

  static void show({required ProgressDialog dialog}) {
    dialog.show();
  }

  static void dismiss({required ProgressDialog dialog}) {
    dialog.dismiss();
  }
}
