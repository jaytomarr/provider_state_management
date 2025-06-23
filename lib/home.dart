import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/list_provider.dart';
import 'package:provider_state_management/second.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  itemCount: numbersProvider.numbers.length,
                  itemBuilder: (context, index) {
                    return Text(
                      numbersProvider.numbers[index].toString(),
                      style: TextStyle(fontSize: 32),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Second()));
                },
                child: Text("Move"),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
