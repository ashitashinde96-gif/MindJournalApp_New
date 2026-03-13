import 'package:flutter/material.dart';
import 'session_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Immersive Journal")),
      body: Center(
        child: ElevatedButton(
          child: Text("Start Session"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SessionScreen()),
            );
          },
        ),
      ),
    );
  }
}