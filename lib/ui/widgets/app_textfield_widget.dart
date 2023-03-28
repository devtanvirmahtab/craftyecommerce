import 'package:flutter/material.dart';

import '../utiles/app_colors.dart';

class AppTextFieldWidget extends StatelessWidget {
  const AppTextFieldWidget({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor)),
      ),
    );
  }
}