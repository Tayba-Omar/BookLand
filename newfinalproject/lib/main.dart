import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newfinalproject/Screen/IntroScreen.dart';

import 'Screen/WelcomeScreen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.deliusTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
        home:Welcomescreen()

    );
  }
}
