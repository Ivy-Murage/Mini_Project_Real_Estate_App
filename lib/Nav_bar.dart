import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(255, 233, 160, 24),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.apartment), label: 'Houses'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
      ],
    );
  }
}
