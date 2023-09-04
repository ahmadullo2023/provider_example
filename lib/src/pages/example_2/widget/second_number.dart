import 'package:flutter/material.dart';

class SecondNumberWidget extends StatelessWidget {
  const SecondNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder()
      ),
    );
  }
}
