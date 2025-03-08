import 'package:flutter/material.dart';

class AccountVieww extends StatefulWidget {
  const AccountVieww({super.key});

  @override
  State<AccountVieww> createState() => _AccountViewwState();
}

class _AccountViewwState extends State<AccountVieww> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('AccountView'),
      ),
    );
  }
}
