import 'package:almanaraa/UI/shared/colors.dart';
import 'package:almanaraa/UI/utils/general_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageTextContainer extends StatelessWidget {
  final String svgAsset;
  final String text;

  const ImageTextContainer({
    Key? key,
    required this.svgAsset,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(5),
      height: screenHieght(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              svgAsset,
              width: screenWidth(15),
              height: screenHieght(15),
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: screenHieght(60)),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'IBM',
                color: AppColors.mainTextColor),
          ),
        ],
      ),
    );
  }
}
