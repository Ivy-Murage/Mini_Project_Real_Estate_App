import "package:flutter/material.dart";

class HousesPage extends StatefulWidget {
  HousesPage({Key? key}) : super(key: key);

  @override
  _HousesPageState createState() => _HousesPageState();
}

class _HousesPageState extends State<HousesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello there"),
      ),
      body: Column(
        child: Container(),
      )
    );
  }
}
