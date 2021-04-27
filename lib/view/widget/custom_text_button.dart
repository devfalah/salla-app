import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomTextButton extends StatelessWidget {
  final String? text;
  final void Function()? onPressed;
  final Color color;

  const CustomTextButton({
    required this.text,
    this.onPressed,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed!,
      child: CustomText(
        text: text,
        color: color,
      ),
    );
  }
}
