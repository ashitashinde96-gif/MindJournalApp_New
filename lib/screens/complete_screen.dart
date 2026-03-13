
// import 'package:flutter/material.dart';
// import 'start_screen.dart';

// class CompleteScreen extends StatelessWidget {

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
//               Icons.check_circle,
//               size: 120,
//               color: Colors.white,
//             ),

//             SizedBox(height: 20),

//             Text(
//               "Session Completed!",
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),

//             SizedBox(height: 20),

//             ElevatedButton(

//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white,
//               ),

//               child: Text(
//                 "Start Again",
//                 style: TextStyle(color: Colors.black),
//               ),

//               onPressed: () {

//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => StartScreen(),
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
import 'start_screen.dart';

class CompleteScreen extends StatelessWidget {
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

                    Icon(
                      Icons.check_circle,
                      size: 120,
                      color: Colors.white,
                    ),

                    SizedBox(height: 20),

                    Text(
                      "Session Completed!",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 30),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),

                      child: Text(
                        "Start Again",
                        style: TextStyle(color: Colors.black),
                      ),

                      onPressed: () {

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StartScreen(),
                          ),
                        );

                      },
                    ),
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