import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 300,
                height: 300,
                child: Image.asset(
                  "assets/logo2.png",
                  width: 90,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "MenukuMania",
              style: TextStyle(
                color: Colors.orange.shade400,
                fontSize: 16,
              ),
            ),
            const Text(
              "Version 1.4",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// class splashNext extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomePage(),
//     );
//   }
// }
