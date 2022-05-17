import 'package:flutter/material.dart';

import '../../widget/common/custom_raised_button.dart';

class SignInButton extends CustomButton {
  // ignore: use_key_in_widget_constructors
  SignInButton(
      {String? text,
      Color? color,
      Color? textColor,
      VoidCallback? onPressed,
      double? border})
      : super(
          child: Text(text ?? "",
              style: TextStyle(color: textColor ?? Colors.red, fontSize: 18)),
          color: color,
          border: border,
          pressed: onPressed,
        );
}
