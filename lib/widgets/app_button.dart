import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {required this.text, this.onPressed, this.customColor, super.key});

  final String text;
  final VoidCallback? onPressed;
  final Color? customColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            side: BorderSide(
                color: customColor != null ? customColor! : Colors.blue),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            )),
        child: Text(text,
            style: TextStyle(
                fontSize: 16,
                color: customColor != null ? customColor! : Colors.blue)));
  }
}
