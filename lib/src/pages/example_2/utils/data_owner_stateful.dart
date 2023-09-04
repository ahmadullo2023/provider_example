import 'package:flutter/material.dart';

import 'data_provider.dart';

class DataOwnerStateful extends StatefulWidget {
  const DataOwnerStateful({super.key});

  @override
  State<DataOwnerStateful> createState() => _DataOwnerStatefulState();
}

class _DataOwnerStatefulState extends State<DataOwnerStateful> {
  int value1 = 0;
  int value2 = 0;

  void incriment1() {
    value1 += 1;
    setState(() {});
  }

  void incriment2() {
    value2 += 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: incriment1,
            child: const Text(
              "pressed buttons 1",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: incriment2,
            child: const Text(
              "pressed buttons 2",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 20),
          DataProvider(
            value1,
            value2,
            child: const DataConsumerStateless(),
          ),
        ],
      ),
    );
  }
}

class DataConsumerStateless extends StatelessWidget {
  const DataConsumerStateless({super.key});

  @override
  Widget build(BuildContext context) {
    final value =
        context.dependOnInheritedWidgetOfExactType<DataProvider>(aspect: "one")?.value1 ?? 0;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$value",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          const DataConsumerStateful()
        ],
      ),
    );
  }
}

class DataConsumerStateful extends StatefulWidget {
  const DataConsumerStateful({super.key});

  @override
  State<DataConsumerStateful> createState() => _DataConsumerStatefulState();
}

class _DataConsumerStatefulState extends State<DataConsumerStateful> {
  @override
  Widget build(BuildContext context) {
    final values =
        context.findAncestorStateOfType<_DataOwnerStatefulState>()?.value1 ?? 0;
    return Text(
      "$values",
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    );
  }
}
