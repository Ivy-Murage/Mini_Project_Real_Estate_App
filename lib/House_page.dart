import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HousePage extends StatelessWidget {
  static const routeName = '/house-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff233C80),
        title: Text('Property Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/home1.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/home4.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/home5.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 250.0,
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                viewportFraction: 0.8,
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Luxury Apartment',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.grey),
                      SizedBox(width: 5.0),
                      Text(
                        '123 Main Street, Anytown, USA',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Text(
                        '\$3,500',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        'per month',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.king_bed),
                          SizedBox(height: 5.0),
                          Text('3 Beds'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.bathtub),
                          SizedBox(height: 5.0),
                          Text('2 Baths'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.room),
                          SizedBox(height: 5.0),
                          Text('5 Rooms'),
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.square_foot),
                          SizedBox(height: 5.0),
                          Text('2,500 sqft'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                  style: TextStyle(fontSize: 16.0),
                  ),
                SizedBox(height: 20.0),
                Center(
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Rent Now'),
                    style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    // ignore: prefer_const_constructors
                    padding: EdgeInsets.symmetric(
                    horizontal: 50.0,
                    vertical: 10.0,
                    ),
                    textStyle: TextStyle(fontSize: 20.0),
                    ),
                ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
  }
}






