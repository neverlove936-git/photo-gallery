import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:photo_gallery/utils/constants/index.dart';

enum TypeDynamicDialog {
  alert,
  confirm,
}
enum ActionDynamicDialog {
  cancel,
  ok,
}

Widget customDialog({
  String title = '',
  String content = '',
  TypeDynamicDialog type = TypeDynamicDialog.alert,
  String btnOK = 'btnOk',
  String btnCancel = 'btnCancel',
  double paddingContentTop = 20,
  double paddingContentBottom = 20,
  TextStyle textStyle = TextThemeStyles.defaultText,
}) {
  return Platform.isIOS
      ? _iosDialog(
          title,
          content,
          type,
          btnOK,
          btnCancel,
          paddingContentTop,
          paddingContentBottom,
          textStyle,
        )
      : _androidDialog(
          title,
          content,
          type,
          btnOK,
          btnCancel,
          paddingContentTop,
          paddingContentBottom,
          textStyle,
        );
}

CupertinoAlertDialog _iosDialog(
  String title,
  String content,
  TypeDynamicDialog type,
  String btnOK,
  String btnCancel,
  double paddingContentTop,
  double paddingContentBottom,
  TextStyle textStyle,
) {
  return CupertinoAlertDialog(
    title: title.isNotEmpty
        ? Text(
            title,
            style: textStyle,
            textAlign: TextAlign.center,
          )
        : null,
    content: content.isNotEmpty
        ? Padding(
            padding: EdgeInsets.only(
              top: paddingContentTop,
              bottom: paddingContentBottom,
            ),
            child: Text(
              content,
              style: TextStyle(
                fontFamily: 'Hiragino Sans',
              ),
            ),
          )
        : null,
    actions: type == TypeDynamicDialog.confirm
        ? <Widget>[
            cupertinoButtonCustom(
              btnCancel.tr,
              ActionDynamicDialog.cancel,
            ),
            cupertinoButtonCustom(
              btnOK.tr,
              ActionDynamicDialog.ok,
            ),
          ]
        : <Widget>[
            Container(
              width: double.infinity,
              child: cupertinoButtonCustom(
                btnCancel.tr,
                ActionDynamicDialog.cancel,
              ),
            ),
          ],
  );
}

AlertDialog _androidDialog(
  String title,
  String content,
  TypeDynamicDialog type,
  String btnOK,
  String btnCancel,
  double paddingContentTop,
  double paddingContentBottom,
  TextStyle textStyle,
) {
  return AlertDialog(
    title: title.isNotEmpty
        ? Text(
            title,
            style: textStyle,
            textAlign: TextAlign.center,
          )
        : null,
    content: content.isNotEmpty
        ? Padding(
            padding: EdgeInsets.only(
              top: paddingContentTop,
              bottom: paddingContentBottom,
            ),
            child: Text(content),
          )
        : null,
    actions: <Widget>[
      textButtonCustom(
        btnCancel.tr,
        ActionDynamicDialog.cancel,
      ),
      if (type == TypeDynamicDialog.confirm)
        textButtonCustom(
          btnOK.tr,
          ActionDynamicDialog.ok,
        )
    ],
  );
}

Widget textButtonCustom(
  final String txtButton,
  final ActionDynamicDialog response,
) {
  return TextButton(
    onPressed: () {
      Get.back(result: response);
    },
    child: Text(
      txtButton,
      style: TextStyle(
        fontSize: 17,
      ),
    ),
  );
}

Widget cupertinoButtonCustom(
  final String txtButton,
  final ActionDynamicDialog response,
) {
  return CupertinoDialogAction(
    onPressed: () {
      Get.back(result: response);
    },
    child: Text(
      txtButton,
      style: TextStyle(
        fontSize: 17,
        fontFamily: 'Hiragino Sans',
      ),
    ),
  );
}
