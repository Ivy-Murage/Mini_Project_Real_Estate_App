import 'package:flutter/material.dart';
import 'package:real_estate_app_mini_project/SignUp.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Expanded(
            child: Container(
                color: Color.fromARGB(255, 7, 25, 72),
                child: Column(
                  children: [
                    Container(
                      height: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                '"Find Your Student-Friendly\nHome, In Just A Few Taps!"',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Color(0xffFFFFFF))),
                            SizedBox(height: 15),
                            Text(
                              "Looking for a House? Worry No More. Discover student-approved living spaces, with just a swipe!",
                              style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: ButtonTheme(
                                    minWidth: 150.0,
                                    height: 50.0,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUp()));
                                      },
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Get Started",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 7, 25, 72),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_sharp,
                                            color:
                                                Color.fromARGB(255, 7, 25, 72),
                                            size: 20,
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
                    SizedBox(
                      height: 12,
                    ),
                    Image(image: AssetImage('assets/images/home3.jpg'))
                  ],
                ))));
  }
}
