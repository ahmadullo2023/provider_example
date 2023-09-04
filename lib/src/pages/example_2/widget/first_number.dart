import 'package:flutter/material.dart';
import 'package:provider_example/src/pages/example_2/widget/summ_button.dart';

class FirstNumberWidget extends StatelessWidget {
  const FirstNumberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
      onChanged: (value) => SimpleCalcWidgetProvider.of(context)
          ?.model
          .firstNumbers = value as int?,
    );
  }
}
