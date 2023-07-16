import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final int lines;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator validator;
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
    required this.lines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: lines,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.only(left: 30, right: 20, top: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
