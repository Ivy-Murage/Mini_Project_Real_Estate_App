import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            color: Color(0xff233C80),
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            '"Find your student-friendly home, \n in just a few taps!"',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                color: Color(0xffFFFFFF))),
                        SizedBox(height: 15),
                        Text(
                          "Looking for a House? Worry No More. Discover student-approved living spaces, with just a swipe!",
                          style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: ButtonTheme(
                                minWidth: 150.0,
                                height: 50.0,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: [
                                      Text(
                                        "Get Started",
                                        style: TextStyle(
                                            color: Color(0xff233C80),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_sharp,
                                        color: Color.fromARGB(255, 25, 45, 100),
                                      )
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      elevation: 12.0,
                                      backgroundColor: Color(0XFFF0F0F0)),
                                ))),
                      ],
                    ),
                  ),
                ),
                Image(image: AssetImage('assets/images/home3.jpg'))
              ],
            )));
  }
}
