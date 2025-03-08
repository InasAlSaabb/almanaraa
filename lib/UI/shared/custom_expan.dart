import 'package:almanaraa/UI/shared/colors.dart';
import 'package:almanaraa/UI/shared/custom_form_field.dart';
import 'package:almanaraa/UI/shared/custom_stepper.dart';
import 'package:almanaraa/UI/utils/general_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomExpandableTile extends StatefulWidget {
  @override
  _CustomExpandableTileState createState() => _CustomExpandableTileState();
}

class _CustomExpandableTileState extends State<CustomExpandableTile> {
  bool _isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: _toggleExpansion,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: [
              ListTile(
                title: Row(
                  children: [
                    Text(
                      '  شحنة أحمد القرعاوي ',
                      style: TextStyle(
                          color: AppColors.mainTextColor,
                          fontFamily: 'IBM',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: screenWidth(20),
                    ),
                    Text(' اليوم 5:00 م',
                        style: TextStyle(
                          color: AppColors.secondaryTextColor,
                          fontFamily: 'IBM',
                          fontSize: 15,
                        )),
                  ],
                ),
                trailing: SvgPicture.asset(_isExpanded
                    ? 'images/Polygon 1.svg'
                    : 'images/Polygon 2.svg'),
              ),
              if (_isExpanded)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomStepper(),
                      SizedBox(height: 20),
                      CustomField(hintText: "تعديل الموعد ")
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
