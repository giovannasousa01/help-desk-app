import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class TextFormFieldPasswordWidget extends StatelessWidget {
  const TextFormFieldPasswordWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.focusNode,
      required this.obscureText,
      required this.suffixIcon, required this.textInputAction});

  final TextEditingController controller;
  final String hintText;
  final FocusNode focusNode;
  final GestureDetector suffixIcon;
  final TextInputAction? textInputAction;

  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: AppColors.primaryOpacityColor,
        hintStyle: GoogleFonts.poppins(
          textStyle: TextStyle(
            color: AppColors.textColorBlue,
            fontSize: 18,
          ),
        ),
        contentPadding: const EdgeInsets.all(15),
        border: InputBorder.none,
        prefixIcon: Icon(
          Icons.lock_rounded,
          color: AppColors.textColorBlue,
        ),
        suffixIcon: suffixIcon,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.buttonRed,
          ),
        ),
        errorStyle: GoogleFonts.poppins(
          color: AppColors.textColorRed,
          fontSize: 12,
        ),
      ),
      style: GoogleFonts.poppins(
        color: AppColors.textColorBlue,
        fontSize: 18,
      ),
    );
  }
}
