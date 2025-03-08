import 'package:flutter/material.dart';
import 'package:get/get.dart';

SizedBox verSpace(double space, BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return SizedBox(
    height: size.height / (space),
  );
}

SizedBox horSpace(double space, BuildContext context) {
  Size size = MediaQuery.of(context).size;

  return SizedBox(
    width: size.width / (space),
  );
}

double screenWidthPercent(double percent, BuildContext context) {
  Size size = MediaQuery.of(context).size;

  return size.width / percent;
}

double screenHeightPercent(double percent, BuildContext context) {
  Size size = MediaQuery.of(context).size;

  return size.height / percent;
}

extension Emptypadding on num {
  SizedBox get ph => SizedBox(
        height: toDouble(),
      );
  SizedBox get pw => SizedBox(
        height: toDouble(),
      );
}

double screenWidth(double percent) {
  return Get.width / percent;
}

double screenHieght(double percent) {
  return Get.height / percent;
}
