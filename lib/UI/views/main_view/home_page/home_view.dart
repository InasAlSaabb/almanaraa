import 'package:almanaraa/UI/shared/colors.dart';
import 'package:almanaraa/UI/shared/custom_expan.dart';
import 'package:almanaraa/UI/shared/custom_form.dart';
import 'package:almanaraa/UI/shared/custom_ship.dart';
import 'package:almanaraa/UI/shared/cutom_image.dart';
import 'package:almanaraa/UI/utils/general_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeViewPersonal extends StatefulWidget {
  const HomeViewPersonal({super.key});

  @override
  State<HomeViewPersonal> createState() => _HomeViewPersonalState();
}

class _HomeViewPersonalState extends State<HomeViewPersonal> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
      child: ListView(
        children: [
          verSpace(40, context),
          Row(
            children: [
              SvgPicture.asset('images/notifications_active.svg'),
              horSpace(2.5, context),
              SvgPicture.asset(
                'images/Group.svg',
              ),
            ],
          ),
          verSpace(30, context),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageTextContainer(
                svgAsset: 'images/Layer_1.svg',
                text: 'بوكــــــس &اكسبريـــس',
              ),
              ImageTextContainer(
                svgAsset: 'images/Group 238017.svg',
                text: 'إشتري لي',
              ),
              ImageTextContainer(
                  svgAsset: 'images/Group 238014.svg',
                  text: 'شحن الأثاث المنزلي'),
              ImageTextContainer(
                svgAsset: 'images/Group 238018.svg',
                text: 'مواد تغليف',
              )
            ],
          ),
          horSpace(200, context),
          CustomSearchBox(
            hintText: 'اكتب رقم او اسم الشحنة للبحث عنها ....',
          ),
          SizedBox(
            height: screenHieght(40),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth(60)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.mainBackColor,
            ),
            child: SizedBox(
              height: screenHieght(1),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth(60)),
                child: ListView(
                  children: [
                    SizedBox(
                      height: screenHieght(50),
                    ),
                    Row(
                      children: [
                        Text(
                          "مواعيدي",
                          style: TextStyle(
                              color: AppColors.mainTextColor,
                              fontFamily: 'IBM',
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: screenWidth(2),
                        ),
                        Text('شاهد أقل',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.secondaryTextColor,
                              color: AppColors.secondaryTextColor,
                              fontFamily: 'IBM',
                              fontSize: 15,
                            ))
                      ],
                    ),
                    CustomExpandableTile(),
                    Text(
                      "المواعيد السابقة: ",
                      style: TextStyle(
                        color: AppColors.secondaryTextColor,
                        fontFamily: 'IBM',
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: screenHieght(1),
                      child: ListView(
                        padding: EdgeInsets.all(16.0),
                        children: [
                          buildShipmentTile(
                              title: 'شحنة جو بايدن',
                              date: '11/06/2024',
                              status: ' قيم الان',
                              rating: null),
                          buildShipmentTile(
                              title: 'شحنة عمرو دياب',
                              date: '23/02/2024',
                              status: 'تم الإلغاء',
                              rating: null),
                          buildShipmentTile(
                              title: 'شحنة ياسر عرفات',
                              date: '23/02/2024',
                              status: '⭐⭐⭐⭐⭐',
                              rating: null),
                          buildShipmentTile(
                              title: 'شحنة عمرو الليسي',
                              date: '23/02/2024',
                              status: 'تم الإلغاء',
                              rating: null),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
