import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({required this.text, required this.onPressed, super.key});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 8, vertical: 8)),
          side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(color: Colors.blue)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)))),
        ),
        child: Text(text,
            style: const TextStyle(fontSize: 16, color: Colors.blue)));
  }
}
