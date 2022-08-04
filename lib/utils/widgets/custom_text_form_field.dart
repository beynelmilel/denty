import 'package:denty/core/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.label,
    this.keyboardType = TextInputType.text,
    required this.controller,
  }) : super(key: key);

  final String label;
  final TextInputType keyboardType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        style: TextStyle(color: themeData.primaryColor),
        keyboardType: keyboardType,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: themeData.primaryColor))));
  }
}
