import 'package:flutter/material.dart';
import 'package:jeel_pay_task/features/jeel_pay/components/first_page_compoenet.dart';
import 'package:jeel_pay_task/features/jeel_pay/components/second_page_component.dart';

class JeelPayScreen extends StatelessWidget {
  const JeelPayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jeel Pay'),
      ),
      body: ListView(
        children: [
          PageView(
            children: [FirstPageCompoenet(), SecondPageComponent()],
          )
        ],
      ),
    );
  }
}
