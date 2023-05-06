import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:carousel_slider/carousel_slider.dart';
import 'package:real_estate_app_mini_project/House_profile.dart';
import 'package:real_estate_app_mini_project/location_service.dart';
import 'package:real_estate_app_mini_project/Models/houses.dart';
import 'package:real_estate_app_mini_project/widget/houses_widget.dart';
import 'package:real_estate_app_mini_project/Profile.dart';

class HousesPage extends StatefulWidget {
  const HousesPage({Key? key}) : super(key: key);

  static const routeName = '/housesPage';
  @override
  _HousesPageState createState() => _HousesPageState();
}

class _HousesPageState extends State<HousesPage> {
  String? lat, long, localCity, subLocalCity;
  final TextEditingController _searchController = TextEditingController();
  String? _searchLocation;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 25, 72),
        elevation: 0,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  child: Text(
                    "Current Location",
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                    "${subLocalCity ?? 'Loading ...'}, ${localCity ?? 'Loading ...'}"),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: Color(0xffffffff),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RealEstateProfilePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 3.0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                      hintText: "Search for houses...",
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 7, 25, 72),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            _searchLocation = null;
                          });
                        },
                        icon: Icon(Icons.clear),
                      )),
                  onSubmitted: (value) {
                    setState(() {
                      _searchLocation = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Trending Properties",
                    style: TextStyle(
                      color: Color.fromARGB(255, 7, 25, 72),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const Text(
                    "See more",
                    style: TextStyle(
                      color: Color.fromARGB(255, 7, 25, 72),
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Column(
                children: [
                  CarouselSlider(
                    // ignore: prefer_const_literals_to_create_immutables
                    items: [
                      Container(
                        width: 300.0,
                        height: 240.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              // ignore: prefer_const_constructors
                              padding: EdgeInsets.only(top: 15.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image(
                                  image: AssetImage('assets/images/home1.jpeg'),
                                  //fit: BoxFit.cover,
                                  width: 200.0,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    "House 1",
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 7, 25, 72),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    "\$300",
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 7, 25, 72),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text("Kimironko, Gasabo"),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text("Per Month"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 300.0,
                        height: 240.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image(
                                  image: AssetImage('assets/images/home1.jpeg'),
                                  //fit: BoxFit.cover,
                                  width: 200.0,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    "House 1",
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 7, 25, 72),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    "\$300",
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 7, 25, 72),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text("Kimironko, Gasabo"),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text("Per Month"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 300.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image(
                                  image: AssetImage('assets/images/home1.jpeg'),
                                  //fit: BoxFit.cover,
                                  width: 200.0,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    "House 1",
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 7, 25, 72),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    "\$300",
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 7, 25, 72),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text("Kimironko, Gasabo"),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text("Per Month"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                    options: CarouselOptions(
                      height: 220.0,
                      viewportFraction: 0.8,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Latest Properties',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 7, 25, 72),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              housesWidget(context, []),
            ],
          ),
        ),
      ),
    );
  }

  void getLocation() async {
    final service = LocationService();
    final locationData = await service.getLocation();

    if (locationData != null) {
      final placeMark = await service.getPlaceMark(locationData: locationData);

      setState(() {
        lat = locationData.latitude!.toStringAsFixed(2);
        long = locationData.longitude!.toStringAsExponential(2);

        localCity = placeMark?.locality ?? 'could not get country';
        subLocalCity = placeMark?.subLocality ?? 'could not get admin area';
      });
    }
  }
}
