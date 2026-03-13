import 'package:flutter/material.dart';

class ReflectionScreen extends StatelessWidget {

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reflection")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            Text(
              "How do you feel?",
              style: TextStyle(fontSize: 22),
            ),

            TextField(
              controller: controller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Write your thoughts..."
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              child: Text("Submit"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}