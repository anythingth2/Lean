import 'package:flutter/material.dart';
import 'Pages/Pages.dart';
import 'Util.dart';
import 'DataRepository.dart';
void main() async {
  DataRepository.initilize();
  await Util.initilize();
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lean',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
