import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final double width;
  final double height;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool expands;
  final int maxLines;
  final Color focusedBorder;
  final double filledOpacity;
  final Color fillColor;
  final Color hintTextColor;
  final bool isBorder;
  final Widget? suffix;
  final Widget? prefix;
  final TextEditingController controller;

  TextInputField(
      {required this.controller,
      required this.hintText,
      this.labelText,
      this.width = double.infinity,
      this.height = 60,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.expands = false,
      this.maxLines = 1,
      this.focusedBorder = Colors.grey,
      this.filledOpacity = 1,
      this.fillColor = Colors.white,
      this.hintTextColor = const Color(0xff000000),
      this.isBorder = true,
      this.prefix,
      this.suffix,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'This Field is Required';
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: prefix,
        suffixIcon: suffix,
        labelText: labelText,
        filled: true,
        fillColor: fillColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorder),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
