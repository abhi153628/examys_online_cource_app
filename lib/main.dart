import 'package:examyys_web_app/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ExamysApp());
}

class ExamysApp extends StatelessWidget {
  const ExamysApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examys',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF4C4CED),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4C4CED),
          primary: const Color(0xFF4C4CED),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const ExamysHomePage(),
    );
  }
}
