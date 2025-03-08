import 'package:almanaraa/UI/shared/base_controller.dart';
import 'package:almanaraa/UI/views/main_view/main_view_widget.dart/bottom_enum.dart';
import 'package:almanaraa/UI/views/main_view/main_view_widget.dart/bottom_navigation_widget.dart';
import 'package:flutter/material.dart';

class maincontroller extends BaseController {
  PageController controller = PageController(initialPage: 0);
  BottomNavigationEnum selected = BottomNavigationEnum.PERSONAL;

  BottomNavigationWidget getBottomNavigation() {
    BottomNavigationWidget bottomnav;
    bottomnav = BottomNavigationWidget(
      navitm: selected,
      ontap: (select, pagenumber) {
        controller.jumpToPage(pagenumber);

        selected = select;
      },
    );
    return bottomnav;
  }
}
