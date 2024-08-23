import 'package:flutter/material.dart';
import 'package:unitask_practicle_hardik/main.dart';
import 'package:unitask_practicle_hardik/other/app_string.dart';

extension ExtOnString on String? {
  Widget text({
    FontWeight? fontWeight,
    double? fontSize,
    Color? color,
    TextAlign? textAlign,
    FontStyle? fontStyle,
  }) {
    return Text(
      this ?? "",
      textAlign: textAlign,
      style: TextStyle(
        fontStyle: fontStyle,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize ?? 14,
        color: color ?? Colors.black,
      ),
    );
  }

  get showSnackBar {
    if (navigatorKey.currentContext != null) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text(
            this ?? someThingWentWrong,
          ),
        ),
      );
    }
  }
}

extension ExtensionOnWidget on Widget {
  appPadding({
    double? all,
    double? left,
    double? right,
    double? top,
    double? bottom,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: all ?? left ?? 0.0,
        right: all ?? right ?? 0.0,
        top: all ?? top ?? 0.0,
        bottom: all ?? bottom ?? 0.0,
      ),
      child: this,
    );
  }
}

extension ExtOnNum on num {
  get spaceH {
    return SizedBox(
      height: toDouble(),
    );
  }

  get spaceW {
    return SizedBox(
      width: toDouble(),
    );
  }
}
