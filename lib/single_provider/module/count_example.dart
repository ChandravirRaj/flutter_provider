import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/single_provider/provider/count_provider.dart';
import 'package:provider/provider.dart';

import 'custom_paint_example.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CountProvider>(context, listen: false);

    if (kDebugMode) {
      print("let's check build method ------->> build");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Count Provider"),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
                width: double.infinity,
              ),
              Center(
                child: Consumer<CountProvider>(
                  builder: (context, countProvider, child) {
                    return Text(
                      '${context.watch<CountProvider>().count}',
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w500),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 50,
                width: double.infinity,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CustomPaintExample()),
                  );
                },
                child: const Text(
                  "Custom Paint",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CountProvider>().setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
