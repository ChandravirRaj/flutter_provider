import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/single_provider/provider/circle_provider.dart';
import 'package:provider/provider.dart';

import 'my_painter.dart';

class CustomPaintExample extends StatefulWidget {
  const CustomPaintExample({super.key});

  @override
  State<CustomPaintExample> createState() => _CustomPaintExampleState();
}

class _CustomPaintExampleState extends State<CustomPaintExample> {
  double _value = 10;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print("--------build method------>> call");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('CustomPaint Example'),
      ),
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          SizedBox(
            width: double.infinity,
            height: 350,
            child: Center(
              child: Consumer<CircleProvider>(
                  builder: (context, circleProvider, child) {
                return CustomPaint(
                  size: Size(circleProvider.width, circleProvider.height),
                  painter:
                      MyPainter(), // Use a custom painter to define the drawing
                );
              }),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Consumer<CircleProvider>(builder: (context, circleProvider, child) {
            return Slider(
              min: 0.0,
              max: 300.0,
              value: circleProvider.width,
              onChanged: (value) {
                context.read<CircleProvider>().setHeightAndWidth(value);
              },
            );
          })
        ],
      )),
    );
  }
}
