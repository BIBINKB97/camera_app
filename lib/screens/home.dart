// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:camera_app/database/db_functions.dart';
import 'package:camera_app/model/data_model.dart';
import 'package:camera_app/screens/gallery.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  File? photo;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Gallery',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.amber,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(5))),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          shape: CircleBorder(
              side: BorderSide(
            style: BorderStyle.solid,
          )),
          backgroundColor: Colors.amber,
          onPressed: () {
            opencamera();
          },
          tooltip: 'open camera',
          child: Icon(
            Icons.add_a_photo_outlined,
            size: 30,
            color: Colors.black,
          ),
        ),
        body: Galley(),
      ),
    );
  }

  Future<void> opencamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      final value = GalleryModel(photo: image.path);
      addPhoto(value);
    }
  }
}
