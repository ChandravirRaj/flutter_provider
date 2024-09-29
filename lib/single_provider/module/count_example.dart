import 'package:flutter/material.dart';
import 'package:flutter_provider/single_provider/provider/count_provider.dart';
import 'package:provider/provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {


  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<CountProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Count Provider"),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: Text(
            provider.count.toString(),
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
