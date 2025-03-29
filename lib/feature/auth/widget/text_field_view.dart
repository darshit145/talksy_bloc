import 'package:flutter/material.dart';

import '../../../util/font_family.dart';
import 'custom_text_field.dart';

class TextFieldView extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;
  final Widget? prefix;
  const TextFieldView(
      {super.key,
      this.prefix,
      required this.title,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          " $title",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14,
              fontFamily: FontFamily.robotoSimple),
        ),
        MyTextField(
          hintText: hintText,
          controller: controller,
          obscureText: title.contains("Pass"),
          prefix: prefix,
          keyboardType:
              title.contains("No") ? TextInputType.phone : TextInputType.text,
        )
      ],
    );
  }
}
