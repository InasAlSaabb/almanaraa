import 'package:almanaraa/UI/shared/colors.dart';
import 'package:flutter/material.dart';

class CustomSearchBox extends StatelessWidget {
  final String hintText;
  final Function(String)? onChanged;

  const CustomSearchBox({
    Key? key,
    required this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.secondaryTextColor,
          fontFamily: 'IBM',
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: AppColors.secondaryTextColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: AppColors.secondaryTextColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: AppColors.secondaryTextColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.search, color: AppColors.secondaryTextColor),
        ),
      ),
    );
  }
}
