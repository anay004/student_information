import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:student_information/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Animation controller setup
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();

    // Navigate to home screen after splash screen
    Timer(Duration(seconds: 4), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Blackish theme
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: Icon(
                Icons.school, // Replace with any desired icon
                size: 100,
                color: Colors.grey[300], // Matches the theme
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Student Info Manager",
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                fontSize: 24,
                color: Colors.grey[300], // Slightly faded white for elegance
                fontWeight: FontWeight.bold,
              ),),
            ),
            SizedBox(height: 10),
            Text(
              "Managing student data efficiently",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[500],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(height: 40),
            CircularProgressIndicator(
              color: Colors.grey[300], // Matches the theme
              strokeWidth: 3, // Adjust thickness
            ),
          ],
        ),
      ),
    );
  }
}
