import 'package:ecommerce_app/models/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterModel>(
      builder: (context, value, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final counter = context.read<CounterModel>();
            counter.incrementCounter();
          },
        ),
        body: Center(
          child: Column(
            children: [
              Text(value.count.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
