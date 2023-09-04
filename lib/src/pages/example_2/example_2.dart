import 'package:flutter/material.dart';

import 'widget/simple_cal_widget.dart';

class Example2 extends StatelessWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: SimpleCalWidget(),
        ),
      ),
    );
  }
}
