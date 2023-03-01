import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.focusNode,
      required this.textInputAction,
      required this.preffixIcon});

  final TextEditingController controller;
  final String hintText;
  final FocusNode focusNode;
  final TextInputAction? textInputAction;
  final Icon? preffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
        prefixIcon: preffixIcon,
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
