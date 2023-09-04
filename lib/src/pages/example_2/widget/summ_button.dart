import 'package:flutter/material.dart';
import 'package:provider_example/src/pages/example_2/widget/provider_model.dart';

class SumButtonsWidget extends StatelessWidget {
  const SumButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => SimpleCalcWidgetProvider.of(context)?.model.sum(),
      child: const Text("посчитать сумму"),
    );
  }
}

class ResultWidget extends StatefulWidget {
  const ResultWidget({super.key});

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  var value = "-1";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final model = SimpleCalcWidgetProvider.of(context)?.model;
    model?.addListener(() {
      value = "${model.result}";
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final value = SimpleCalcWidgetProvider.of(context)?.model.result ?? 0;
    return Text("$value resultati");
  }
}

class SimpleCalcWidgetProvider extends InheritedWidget {
  final SimpleCalcWidgetModel model;
  const SimpleCalcWidgetProvider({
    super.key,
    required super.child,
    required this.model,
  });

  static SimpleCalcWidgetProvider? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SimpleCalcWidgetProvider>();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
