import 'package:flutter/material.dart';

class CusrtomTextFormField extends StatelessWidget {
  final TextEditingController controller;

  final String title;
  final int maxLine;
  final FormFieldValidator<String>? validator;

  CusrtomTextFormField({
    super.key,
    required this.controller,
    required this.title,
    this.maxLine = 1,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: title,
      ),
    );
  }
}
