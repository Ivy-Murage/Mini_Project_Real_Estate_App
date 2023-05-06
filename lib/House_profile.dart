import 'package:flutter/material.dart';
import 'package:real_estate_app_mini_project/Models/houses.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HousePage extends StatelessWidget {
  final House house;
  const HousePage({required this.house});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('House Details'),
          backgroundColor: Color.fromARGB(255, 7, 25, 72),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                  ),
                  items: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        house.imageUrl,
                        height: 200.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        house.imageUrl,
                        height: 200.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        house.imageUrl,
                        height: 200.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          house.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 7, 25, 72),
                            fontSize: 24.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            SizedBox(width: 5.0),
                            Text(
                              house.location,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Cost: \$${house.cost}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 7, 25, 72),
                            fontSize: 24.0,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            SizedBox(width: 5.0),
                            Text(
                              "Per Month",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Icons.king_bed),
                            SizedBox(width: 5.0),
                            Text(
                              'Beds: ${house.bedrooms}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Icons.bathtub),
                            SizedBox(width: 4.0),
                            Text(
                              'Baths: ${house.bathrooms}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Icons.square_foot),
                            SizedBox(width: 0.5),
                            Text(
                              'Size: ${house.plotsize} m²',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 7, 25, 72),
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 10.0),
                Text(
                  house.description,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 100, 105, 117),
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Contact Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 7, 25, 72),
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 5.0),
                    Text(
                      'Property Owner: ${house.propertyowner}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(width: 5.0),
                    Text(
                      'Contact Number: ${house.contact}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
