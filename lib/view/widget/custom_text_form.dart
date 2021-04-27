import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final IconData iconData;
  final bool obscureText;
  final TextInputType keyboardType;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;

  const CustomTextFormField({
    required this.hintText,
    required this.iconData,
    required this.onSaved,
    required this.validator,
    required this.keyboardType,
    this.onFieldSubmitted,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        prefixIcon: IconButton(
          icon: Icon(iconData),
          onPressed: () {},
        ),
      ),
      onSaved: onSaved,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
