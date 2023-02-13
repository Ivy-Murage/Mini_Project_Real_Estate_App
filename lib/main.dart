import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_estate_app_mini_project/landingPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: GoogleFonts.outfit().fontFamily,
          primaryColor: Color(0xff233C80)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Real Estate App"),
          backgroundColor: Color(0xff233C80),
        ),
        body: SingleChildScrollView(child: LandingPage()),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromARGB(255, 233, 160, 24),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.apartment), label: 'Houses'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
          ],
        ));
  }
}
