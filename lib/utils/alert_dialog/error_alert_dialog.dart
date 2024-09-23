import 'package:flutter/material.dart';

class ErrorAlertDialog extends AlertDialog {
  ErrorAlertDialog({
    super.key,
    required String content,
    String title = 'Hata',
    String buttonText = 'Tamam',
    TextStyle? titleStyle,
    VoidCallback? onPressed,
  }) : super(
          title: Text(title, style: titleStyle),
          content: Text(content),
          actions: [TextButton(onPressed: onPressed, child: Text(buttonText))],
        );
}
