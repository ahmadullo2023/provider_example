import 'package:flutter/material.dart';

import 'package:provider_example/src/pages/example_2/widget/provider_model.dart';
import 'package:provider_example/src/pages/example_2/widget/second_number.dart';
import 'package:provider_example/src/pages/example_2/widget/summ_button.dart';

import 'first_number.dart';

class SimpleCalWidget extends StatefulWidget {
  const SimpleCalWidget({super.key});

  @override
  State<SimpleCalWidget> createState() => _SimpleCalWidgetState();
}

class _SimpleCalWidgetState extends State<SimpleCalWidget> {
  @override
  Widget build(BuildContext context) {

    final models = SimpleCalcWidgetModel();


    return  Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SimpleCalcWidgetProvider(
          model: models,
          child:  Column(
            children: [
              FirstNumberWidget(),
              SizedBox(height: 30),
              SecondNumberWidget(),
              SizedBox(height: 30),
              SumButtonsWidget(),
              SizedBox(height: 30),
              ResultWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
