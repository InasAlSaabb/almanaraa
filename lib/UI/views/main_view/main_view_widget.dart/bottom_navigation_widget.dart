import 'package:almanaraa/UI/shared/colors.dart';
import 'package:almanaraa/UI/utils/general_utils.dart';
import 'package:almanaraa/UI/views/main_view/main_view_widget.dart/bottom_enum.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationWidget extends StatefulWidget {
  final BottomNavigationEnum navitm;
  final Function(BottomNavigationEnum, int) ontap;
  const BottomNavigationWidget(
      {super.key, required this.navitm, required this.ontap});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          width: screenWidth(1),
          height: screenHieght(15),
        ),
        Positioned(
          left: screenWidth(20),
          right: screenWidth(20),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth(80)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  navItem(
                      text: 'الرئيسية',
                      ontap: () {
                        widget.ontap(BottomNavigationEnum.PERSONAL, 0);
                      },
                      size: size,
                      imagename: 'ic_home',
                      isslected:
                          widget.navitm == BottomNavigationEnum.PERSONAL),
                  SizedBox(
                    width: screenWidth(50),
                  ),
                  navItem(
                      text: 'حاسبة الشحن',
                      ontap: () {
                        widget.ontap(BottomNavigationEnum.SHIPPINGCALC, 1);
                      },
                      size: size,
                      imagename: 'ic_calc',
                      isslected:
                          widget.navitm == BottomNavigationEnum.SHIPPINGCALC),
                  SizedBox(
                    width: screenWidth(10),
                  ),
                  navItem(
                      text: 'محفظتي',
                      ontap: () {
                        widget.ontap(BottomNavigationEnum.WALLET, 2);
                      },
                      size: size,
                      imagename: 'ic_wallet',
                      isslected: widget.navitm == BottomNavigationEnum.WALLET),
                  SizedBox(
                    width: screenWidth(50),
                  ),
                  navItem(
                      text: 'حسابي',
                      ontap: () {
                        widget.ontap(BottomNavigationEnum.ACCOUNT, 3);
                      },
                      size: size,
                      imagename: 'ic_personal',
                      isslected: widget.navitm == BottomNavigationEnum.ACCOUNT),
                ]),
          ),
        ),
      ],
    );
  }

  Widget navItem(
      {required Size size,
      required String imagename,
      required bool isslected,
      required String text,
      required Function ontap}) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Column(
        children: [
          SvgPicture.asset(
            'images/$imagename.svg',
            color: isslected
                ? AppColors.mainTextColor
                : AppColors.secondaryTextColor,
            width: screenWidth(17),
          ),
          Text(
            text,
            style: TextStyle(
                color: isslected
                    ? AppColors.mainTextColor
                    : AppColors.secondaryTextColor,
                fontFamily: 'IBM'),
          ),
        ],
      ),
    );
  }
}
