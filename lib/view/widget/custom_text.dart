import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final int maxLines;
  final Color color;
  final bool isOverflow;
  final bool isLineThrough;

  const CustomText({
    required this.text,
    this.fontSize = 16,
    this.maxLines = 1,
    this.color = Colors.black,
    this.isOverflow = false,
    this.isLineThrough = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        decoration:isLineThrough? TextDecoration.lineThrough:null,
      ),
      overflow: isOverflow ? TextOverflow.ellipsis : null,
    );
  }
}
