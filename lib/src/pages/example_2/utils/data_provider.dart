import 'package:flutter/cupertino.dart';

class DataProvider extends InheritedWidget {
  final int value1;
  final int value2;

  const DataProvider(this.value1, this.value2,
      {super.key, required super.child});

  @override
  bool updateShouldNotifyDependent(
    covariant DataProvider oldWidget,
    Set<String> aspects,
  ) {
    final isValueUpdated1 = value1 != oldWidget.value1;
    final isValueUpdated2 = value2 != oldWidget.value2;
    return isValueUpdated1  || isValueUpdated2;
  }

  @override
  bool updateShouldNotify(DataProvider oldWidget) {
    return value1 != oldWidget.value1 || value2 != oldWidget.value2;
  }
}
