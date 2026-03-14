
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'complete_screen.dart';

class SessionScreen extends StatefulWidget {
  @override
  _SessionScreenState createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen>
    with SingleTickerProviderStateMixin {

  List steps = [];
  int index = 0;

  AudioPlayer player = AudioPlayer();
  bool isPlaying = false;

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    loadSession();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    animation = Tween<double>(begin: 150, end: 220).animate(controller);
  }

  Future loadSession() async {
    String data = await rootBundle.loadString('assets/session.json');
    var jsonData = json.decode(data);

    setState(() {
      steps = jsonData["session"];
    });
  }

  void playAudio(String audioPath) async {

    String fileName = audioPath.replaceAll("assets/", "");

    if (!isPlaying) {

      await player.play(AssetSource(fileName));
      controller.repeat(reverse: true);

      setState(() {
        isPlaying = true;
      });

    } else {

      await player.stop();
      controller.stop();

      setState(() {
        isPlaying = false;
      });
    }
  }

  void nextStep() {

    if (index < steps.length - 1) {

      player.stop();
      controller.stop();

      setState(() {
        index++;
        isPlaying = false;
      });

    } else {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CompleteScreen(),
        ),
      );
    }
  }

  void previousStep() {

    if (index > 0) {

      player.stop();
      controller.stop();

      setState(() {
        index--;
        isPlaying = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    if (steps.isEmpty) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    var step = steps[index];

    return Scaffold(

      appBar: AppBar(
        title: Text("Session"),
        backgroundColor: Colors.deepPurple,
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {

          return Container(
            width: double.infinity,

            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF89CFF0),
                  Color(0xFFC3B1E1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),

            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(height: 20),

                    Text(
                      "Step ${index + 1} / ${steps.length}",
                      style: TextStyle(fontSize: 18),
                    ),

                    SizedBox(height: 20),

                    AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {

                        return Container(
                          width: animation.value,
                          height: animation.value,

                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.4),
                            shape: BoxShape.circle,
                          ),

                          child: Center(
                            child: Text(
                              "Breathe",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        );
                      },
                    ),

                    SizedBox(height: 20),

                    Image.asset(
                      step["image"],
                      height: 200,
                    ),

                    SizedBox(height: 20),

                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        step["text"],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),

                      onPressed: () {
                        playAudio(step["audio"]);
                      },

                      child: Text(
                        isPlaying ? "Stop Audio" : "Play Audio",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),

                    SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),

                          onPressed: previousStep,

                          child: Text(
                            "Previous",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),

                          onPressed: nextStep,

                          child: Text(
                            "Next",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}