
import 'package:flutter/material.dart';
import 'screens/start_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mindfulness App",

      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),

      home: StartScreen(),
    );
  }
}