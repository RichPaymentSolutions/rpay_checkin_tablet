import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  static showOkDialog(
    BuildContext context,
    String msg, {
    bool isCancel = false,
    String? titleCancel,
    String? titleOK,
    Function()? okAction,
  }) async {
    if (Platform.isAndroid) {
      await _showAndroidOkDialog(
        context,
        msg,
        okAction: okAction,
        isCancel: isCancel,
        titleCancel: titleCancel,
      );
    } else {
      await _showIosOKDialog(
        context,
        msg,
        okAction: okAction,
        isCancel: isCancel,
        titleCancel: titleCancel,
      );
    }
  }

  static _showIosOKDialog(
    BuildContext context,
    String msg, {
    String? titleCancel,
    bool isCancel = false,
    String? titleOK,
    Function()? okAction,
  }) async {
    var actions = [
      CupertinoDialogAction(
        child: Text(
          titleOK ?? 'Ok',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
          if (okAction != null) {
            okAction();
          }
        },
      )
    ];
    if (isCancel) {
      actions.add(
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            titleCancel ?? 'Cancel',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );
    }
    await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Notice'),
        content: Text(msg),
        actions: actions,
      ),
    );
  }

  static _showAndroidOkDialog(
    BuildContext context,
    String msg, {
    bool isCancel = false,
    String? titleCancel,
    String? titleOK,
    Function()? okAction,
  }) async {
    var actions = [
      TextButton(
        child: Text(
          titleOK ?? "Đồng ý",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pop();
          if (okAction != null) {
            okAction();
          }
        },
      )
    ];
    if (isCancel)
      actions.add(
        TextButton(
          child: Text(
            titleCancel ?? 'Huỷ bỏ',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Thông báo"),
      content: Text(msg),
      actions: actions,
    );

    // show the dialog
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
