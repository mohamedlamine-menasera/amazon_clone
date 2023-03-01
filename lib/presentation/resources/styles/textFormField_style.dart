import 'package:flutter/material.dart';

TextFormField getTextFormField({
  Key? key,
  required TextEditingController controller,
  required String hintText,
  bool obscureText = false,
  TextInputType textInputType = TextInputType.text,
  maxLines = 1,
}) =>
    TextFormField(
      keyboardType: textInputType,
      obscureText: obscureText,
      key: key,
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return "Enter your $hintText";
        }
        return null; // No errors return null
      },
      maxLines: maxLines,
    );
