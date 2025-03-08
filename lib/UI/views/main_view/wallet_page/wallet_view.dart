import 'package:flutter/material.dart';

class WalletVieww extends StatefulWidget {
  const WalletVieww({super.key});

  @override
  State<WalletVieww> createState() => _WalletViewwState();
}

class _WalletViewwState extends State<WalletVieww> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('WalletView'),
      ),
    );
  }
}
