import 'package:almanaraa/UI/shared/colors.dart';
import 'package:almanaraa/UI/utils/general_utils.dart';
import 'package:flutter/material.dart';

Widget buildShipmentTile({
  required String title,
  required String date,
  String? status,
  String? rating,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8.0),
    padding: EdgeInsets.all(16.0),
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
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'IBM',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: screenWidth(20)),
              Text(
                date,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              if (status == ' قيم الان') ...[
                SizedBox(width: screenWidth(20)),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(color: Colors.white),
                    backgroundColor: AppColors.mainOrangeColor,
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  child: Text('قيم الآن'),
                ),
              ] else if (status != null) ...[
                SizedBox(width: screenWidth(20)),
                Text(
                  status,
                  style: TextStyle(
                    fontFamily: 'IBM',
                    color: status == 'تم الإلغاء' ? Colors.red : Colors.green,
                    fontSize: 14,
                  ),
                ),
              ],
              if (rating != null) SizedBox(width: screenWidth(20)),
              if (rating != null)
                Text(
                  rating,
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 14,
                  ),
                ),
            ],
          ),
        ),
      ],
    ),
  );
}
