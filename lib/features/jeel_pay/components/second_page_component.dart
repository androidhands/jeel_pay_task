import 'package:flutter/material.dart';

class SecondPageComponent extends StatelessWidget {
  const SecondPageComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Center(
        child: Text(
          'This is the second page of the Jeel Pay app.\n\n'
          'You can add more features or content here as needed.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      ),
    );
  }
}
