import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app_mini_project/Models/houses.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class HouseRegister extends StatefulWidget {
  @override
  State<HouseRegister> createState() => _HouseRegisterState();
}

class _HouseRegisterState extends State<HouseRegister> {
  final controllerName = TextEditingController();
  final controllerLocation = TextEditingController();
  final controllerCost = TextEditingController();
  final controllerImageUrl = TextEditingController();
  final controllerBedrooms = TextEditingController();
  final controllerBathrooms = TextEditingController();
  final controllerPropertyowner = TextEditingController();
  final controllerPlotsize = TextEditingController();
  final controllerContact = TextEditingController();
  final controllerDescription = TextEditingController();
  late File _selectedImage;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Add a House'),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextField(
              controller: controllerName,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'House',
                hintText: 'Enter House Name',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              child: Text('Select Image'),
              onPressed: () async {
                final result =
                    await FilePicker.platform.pickFiles(type: FileType.image);
                if (result != null) {
                  setState(() {
                    _selectedImage = File(result.files.single.path!);
                  });
                }
              },
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controllerBedrooms,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Bedrooms',
                hintText: 'Enter the number of bedrooms',
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controllerBathrooms,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Bathrooms',
                hintText: 'Enter the number of bathrooms',
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controllerPropertyowner,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Property Owner',
                hintText: 'Enter the property owner',
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controllerPlotsize,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Plot Size',
                hintText: 'Enter the plot size in sq ft',
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controllerCost,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Cost',
                hintText: 'Enter House Cost Per Month',
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controllerContact,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Contact',
                hintText: 'Enter Contact Phone Number',
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controllerDescription,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
                hintText: 'Enter House Description',
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              child: Text('Create'),
              onPressed: () {
                final house = House(
                  name: controllerName.text,
                  location: controllerLocation.text,
                  cost: controllerCost.text,
                  imageUrl: controllerImageUrl.text,
                  bedrooms: controllerBedrooms.text,
                  bathrooms: controllerBathrooms.text,
                  propertyowner: controllerPropertyowner.text,
                  plotsize: controllerPlotsize.text,
                  contact: controllerContact.text,
                  description: controllerDescription.text,
                );

                createHouse(house, _selectedImage);

                Navigator.pop(context);
              },
            )
          ],
        ),
      );

  Future createHouse(House house, File? selectedImage) async {
    final docHouse = FirebaseFirestore.instance.collection('houses').doc();
    house.id = docHouse.id;

    if (selectedImage != null) {
      final storageRef =
          FirebaseStorage.instance.ref().child('houses/${house.id}');
      final uploadTask = storageRef.putFile(selectedImage);
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();

      final json = house.toJson()
        ..addAll({
          'imageUrl': downloadUrl,
        });

      await docHouse.set(json);
    } else {
      await docHouse.set(house.toJson());
    }
  }
}
