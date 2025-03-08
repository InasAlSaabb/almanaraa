import 'package:flutter/material.dart';

class ShippingCalcView extends StatefulWidget {
  const ShippingCalcView({super.key});

  @override
  State<ShippingCalcView> createState() => _ShippingCalcViewState();
}

class _ShippingCalcViewState extends State<ShippingCalcView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('ShippingCalcView'),
      ),
    );
  }
}
