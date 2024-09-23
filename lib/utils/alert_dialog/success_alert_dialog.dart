import 'package:flutter/material.dart';

class SuccessAlertDialog extends AlertDialog {
  SuccessAlertDialog({
    super.key,
    required String content,
    String title = 'Başarılı',
    String buttonText = 'Tamam',
    VoidCallback? onPressed,
  }) : super(
          title: Text(title),
          content: Text(content),
          actions: [TextButton(onPressed: onPressed, child: Text(buttonText))],
        );
}
