import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/home.dart';
import 'package:provider_state_management/list_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NumbersListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Provider",
        home: Home(),
      ),
    );
  }
}
