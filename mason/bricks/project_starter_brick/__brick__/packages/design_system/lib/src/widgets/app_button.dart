import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.text, this.onPressed, this.color});

  final String text;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: color != null
          ? ElevatedButton.styleFrom(backgroundColor: color)
          : null,
      child: Text(text),
    );
  }
}
