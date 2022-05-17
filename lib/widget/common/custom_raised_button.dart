import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const CustomButton({this.color, this.child, this.border, this.pressed});

  final Widget? child;
  final Color? color;
  final double? border;
  final VoidCallback? pressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: color ?? Colors.black,
          primary: color ?? Colors.blue,
          minimumSize: const Size(88, 36),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(border ?? 0)),
          ),
        ),
        onPressed: pressed,
        child: child ?? const Text('a'));
  }
}
