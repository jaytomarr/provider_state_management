import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/list_provider.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      builder: (context, numbersProvider, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            numbersProvider.add();
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("Provider"),
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
        ),
        body: Container(
          child: Column(
            children: [
              Text(
                numbersProvider.numbers.last.toString(),
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: numbersProvider.numbers.length,
                  itemBuilder: (context, index) {
                    return Text(
                      numbersProvider.numbers[index].toString(),
                      style: TextStyle(fontSize: 32),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
