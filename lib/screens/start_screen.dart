
// import 'package:flutter/material.dart';
// import 'session_screen.dart';

// class StartScreen extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(

//       body: Container(
//         width: double.infinity,

//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFF89CFF0),
//               Color(0xFFC3B1E1),
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),

//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [

//             Icon(
//               Icons.self_improvement,
//               size: 120,
//               color: Colors.white,
//             ),

//             SizedBox(height: 20),

//             Text(
//               "Mindfulness Session",
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),

//             SizedBox(height: 15),

//             Text(
//               "Relax • Breathe • Focus",
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.white70,
//               ),
//             ),

//             SizedBox(height: 40),

//             ElevatedButton(

//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white,
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 40,
//                   vertical: 15,
//                 ),
//               ),

//               child: Text(
//                 "Start Session",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 18,
//                 ),
//               ),

//               onPressed: () {

//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => SessionScreen(),
//                   ),
//                 );

//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'session_screen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
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

                    SizedBox(height: 80),

                    Icon(
                      Icons.self_improvement,
                      size: 120,
                      color: Colors.white,
                    ),

                    SizedBox(height: 20),

                    Text(
                      "Mindfulness Session",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Relax • Breathe • Focus",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),

                    SizedBox(height: 40),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 15,
                        ),
                      ),

                      child: Text(
                        "Start Session",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),

                      onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SessionScreen(),
                          ),
                        );

                      },
                    ),

                    SizedBox(height: 80),

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