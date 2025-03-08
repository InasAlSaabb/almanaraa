import 'package:almanaraa/UI/shared/colors.dart';
import 'package:flutter/material.dart';

Widget buildButton({
  required String text,
  required Color backgroundColor,
  required Color textColor,
  Color? borderColor,
  bool hasShadow = false,
  required VoidCallback onPressed,
}) {
  return Container(
    height: 56,
    decoration: BoxDecoration(
      boxShadow: hasShadow
          ? [
              BoxShadow(
                color: AppColors.mainOrangeColor,
                blurRadius: 15,
                offset: Offset(0, 5),
              )
            ]
          : null,
    ),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: textColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: 1,
          ),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'IBM',
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
