import 'package:flutter/material.dart';
import 'package:jeel_pay_task/features/jeel_pay/screens/jeel_pay_screen.dart';

void main() {
  runApp(const JeelPayApp());
}

class JeelPayApp extends StatelessWidget {
  const JeelPayApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JeelPay',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  JeelPayScreen(),
    );
  }
}