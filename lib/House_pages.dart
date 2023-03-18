
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:carousel_slider/carousel_slider.dart';
import 'package:real_estate_app_mini_project/House_page.dart';

class HousesPage extends StatefulWidget {
  const HousesPage({Key? key}) : super(key: key);
  

  @override
  _HousesPageState createState() => _HousesPageState();
}

class _HousesPageState extends State<HousesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff233C80),
        elevation: 0,
        title: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  child: Text(
                    "Current Location",
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 15,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Gasabo, Kigali",
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
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
            onPressed: () {},
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
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Search for houses...",
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xff233C80),
                  ),
                ),
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
                    color: Color(0xff233C80),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const Text(
                  "See more",
                  style: TextStyle(
                    color: Color(0xff233C80),
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
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  "House 1",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff233C80),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  "\$300",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff233C80),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text("Kimironko, Gasabo"),
                            ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  "House 1",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff233C80),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  "\$300",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff233C80),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text("Kimironko, Gasabo"),
                            ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  "House 1",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff233C80),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  "\$300",
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff233C80),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text("Kimironko, Gasabo"),
                            ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text("Per Month"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                  ],
                  options: CarouselOptions(
                    height: 200.0,
                    viewportFraction: 0.8,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                  ),
                ),


                const SizedBox(height: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Latest Properties',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff233C80),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    SizedBox(
                      height: 118.0, // set the height to the desired value
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),

                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HousePage()),
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 80.0,
                                      width: 80.0,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(10.0),
                                        image: const DecorationImage(
                                          image: AssetImage('assets/images/home5.jpeg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Beachfront Villa",
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff233C80),
                                            ),
                                          ),
                                          Text(
                                            "Miami, Florida",
                                            style: TextStyle(
                                              fontSize: 13.0,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff233C80),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 8.0),
                                    const Text(
                                      "\$800",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),



              ],
            ),
          ],
          
        ),
      ),
      ),
      

    );
  }
}

