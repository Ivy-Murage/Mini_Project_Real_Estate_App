import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app_mini_project/Models/houses.dart';
import 'package:real_estate_app_mini_project/House_page.dart';
import 'package:firebase_storage/firebase_storage.dart';

String? _searchLocation; // Define the variable outside the widget

Widget housesWidget(
    BuildContext context, List<QueryDocumentSnapshot<Object?>> data) {
  return SingleChildScrollView(
    child: StreamBuilder<List<House>>(
      stream: readHouses(),
      builder: (context, snapshot) {
        try {
          if (snapshot.hasError) {
            throw snapshot.error!;
          } else if (snapshot.hasData) {
            final houses = snapshot.data!;

            // Filter houses based on search location
            final filteredHouses = _searchLocation == null
                ? houses
                : houses
                    .where((house) => house.location
                        .toLowerCase()
                        .contains(_searchLocation!.toLowerCase()))
                    .toList();

            return ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: filteredHouses
                  .map((house) => Column(
                        children: [
                          SizedBox(height: 10),
                          buildHouse(context, house),
                        ],
                      ))
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        } catch (e) {
          return Center(
            child: Text(e.toString()),
          );
        }
      },
    ),
  );
}

Widget buildHouse(BuildContext context, House house) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HousePage(house: house)),
      );
    },
    child: FutureBuilder(
      future:
          FirebaseStorage.instance.ref('houses/${house.id}').getDownloadURL(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error fetching image');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            width: 80.0,
            height: 80.0,
            color: Colors.grey,
          );
        }
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage(snapshot.data!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.0),
              Expanded(
                child: Row(
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
                            fontSize: 16.0,
                          ),
                        ),
                        Text(house.location),
                      ],
                    ),
                    Spacer(),
                    Text(
                      'Cost: \$${house.cost}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 7, 25, 72),
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

Stream<List<House>> readHouses() => FirebaseFirestore.instance
    .collection('houses')
    .limit(5) // add this line to limit the number of houses fetched
    .snapshots()
    .map((snapshot) => snapshot.docs
        .map((doc) => House.fromJson({
              ...doc.data(),
              'imageUrl': doc.data().containsKey('imageUrl')
                  ? doc.data()['imageUrl']
                  : '',
            }))
        .toList());
