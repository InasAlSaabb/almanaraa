import 'package:almanaraa/UI/shared/colors.dart';
import 'package:almanaraa/UI/shared/custom_button.dart';
import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({Key? key}) : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int _currentIndex = 1;

  void _nextStep() {
    if (_currentIndex < 3) {
      setState(() {
        _currentIndex++;
      });
    }
  }

  void _previousStep() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> labels = [
      'تم الحجز',
      'تأكيد الموعد',
      'في الطريق',
      'استلام الطلب'
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20),
          Container(
            height: 50,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 25,
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 2,
                    color: Colors.grey.shade300,
                  ),
                ),
                Positioned(
                  top: 25,
                  right: 20,
                  width: _getActiveLineWidth(_currentIndex),
                  child: Container(
                    height: 2,
                    color: Colors.orange,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      4,
                      (index) => Column(
                        children: [
                          Text(
                            labels[index],
                            style: TextStyle(
                              color: index == _currentIndex
                                  ? Colors.orange
                                  : Colors.grey,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 5),
                          GestureDetector(
                            onTap: () => setState(() => _currentIndex = index),
                            child: Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index <= _currentIndex
                                    ? Colors.orange
                                    : Colors.grey.shade300,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          if (_currentIndex != 1)
            Text(
              'الخطوة الحالية: ${_currentIndex + 1} - ${labels[_currentIndex]}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          if (_currentIndex == 1)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "هل تريد تأكيد الموعد؟",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mainOrangeColor,
                      fontFamily: 'IBM'),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: buildButton(
                        text: "نعم, تأكيد",
                        backgroundColor: AppColors.mainOrangeColor,
                        textColor: Colors.white,
                        hasShadow: true,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: buildButton(
                        text: "لا, إلغاء",
                        backgroundColor: Colors.white,
                        textColor: AppColors.mainOrangeColor,
                        borderColor: AppColors.mainOrangeColor,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  double _getActiveLineWidth(int currentIndex) {
    double fullWidth = MediaQuery.of(context).size.width - 40;
    double stepWidth = fullWidth / 3;

    if (currentIndex == 0) return 0;

    return stepWidth * currentIndex;
  }
}
