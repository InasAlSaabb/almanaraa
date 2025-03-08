import 'package:almanaraa/UI/shared/colors.dart';
import 'package:almanaraa/UI/views/main_view/account_page/account_view.dart';
import 'package:almanaraa/UI/views/main_view/home_page/home_view.dart';
import 'package:almanaraa/UI/views/main_view/main_view_widget.dart/bottom_enum.dart';
import 'package:almanaraa/UI/views/main_view/main_view_widget.dart/bottom_navigation_widget.dart';
import 'package:almanaraa/UI/views/main_view/shipping_calc_page/shipping_clac_view.dart';
import 'package:almanaraa/UI/views/main_view/wallet_page/wallet_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  PageController controller = PageController(initialPage: 0);
  BottomNavigationEnum selected = BottomNavigationEnum.PERSONAL;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          // منطق الزر العائم
        },
        backgroundColor: AppColors.mainOrangeColor,
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      key: key,
      bottomNavigationBar: BottomNavigationWidget(
        navitm: selected,
        ontap: (select, pagenumber) {
          controller.jumpToPage(pagenumber);

          setState(() {
            selected = select;
          });
        },
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          HomeViewPersonal(),
          ShippingCalcView(),
          WalletVieww(),
          AccountVieww(),
        ],
      ),
    ));
  }
}
