import 'package:asset_tracker/utils/alert_dialog/error_alert_dialog.dart';
import 'package:asset_tracker/utils/alert_dialog/success_alert_dialog.dart';
import 'package:flutter/material.dart';

class DisplayAlertDialog {
  late final BuildContext _context;
  final String _success = 'Başarılı';
  final String _error = 'Hata';
  final String _okay = 'Tamam';
  final String _no = 'Hayır';
  final String _yes = 'Evet';
  final String _attention = 'Dikkat';

  DisplayAlertDialog(BuildContext context) {
    _context = context;
  }

  Future<T?> successAlert<T>(
    String content, {
    String? title,
    String? buttonText,
    VoidCallback? onPressed,
    bool dismissible = true,
  }) {
    return showDialog<T?>(
        context: _context,
        barrierDismissible: dismissible,
        useRootNavigator: false,
        builder: (context) {
          return PopScope(
            canPop: dismissible,
            child: SuccessAlertDialog(
              title: title ?? _success,
              content: content,
              buttonText: buttonText ?? _okay,
              onPressed: () {
                Navigator.of(context).maybePop();
                onPressed?.call();
              },
            ),
          );
        });
  }

  Future<T?> errorAlert<T>(
    String content, {
    String? title,
    String? buttonText,
    VoidCallback? onPressed,
    bool dismissible = true,
    TextStyle? titleStyle,
  }) {
    return showDialog<T?>(
        context: _context,
        barrierDismissible: dismissible,
        useRootNavigator: false,
        builder: (context) {
          return PopScope(
            canPop: dismissible,
            child: ErrorAlertDialog(
              title: title ?? _error,
              titleStyle: titleStyle,
              content: content,
              buttonText: buttonText ?? _okay,
              onPressed: () {
                Navigator.of(context).maybePop();
                onPressed?.call();
              },
            ),
          );
        });
  }

  Future<T?> custom<T>({required Widget dialog, bool barrierDismissible = true}) {
    return showDialog<T?>(
      barrierDismissible: barrierDismissible,
      builder: (context) => dialog,
      context: _context,
    );
  }

  Future<T?> customAlert<T>({
    Widget? content,
    Widget Function(BuildContext)? builder,
    bool isDismissible = true,
    bool isSelfKioskMode = false,
    EdgeInsets? insetPadding,
  }) {
    return showDialog<T?>(
        context: _context,
        barrierDismissible: isDismissible,
        useRootNavigator: false,
        builder: builder ??
            (context) {
              return AlertDialog(
                  backgroundColor: Colors.transparent,
                  contentPadding: EdgeInsets.zero,
                  titlePadding: EdgeInsets.zero,
                  insetPadding: insetPadding!,
                  content: SizedBox(
                    width: double.maxFinite,
                    child: content,
                  ));
            });
  }

  Future<T?> twoButtonAlert<T>({
    required Widget content,
    Widget? title,
    String? leftText,
    String? rightText,
    bool isDismissible = true,
    required VoidCallback leftClicked,
    required VoidCallback rightClicked,
  }) {
    return showDialog<T?>(
        context: _context,
        barrierDismissible: isDismissible,
        builder: (context) {
          return AlertDialog(
            actions: [
              TextButton(
                onPressed: leftClicked,
                child: Text(
                  leftText ?? _no,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Theme.of(context).shadowColor),
                ),
              ),
              TextButton(onPressed: rightClicked, child: Text(rightText ?? _yes)),
            ],
            content: content,
            title: title ?? Text(_attention),
          );
        });
  }
}
