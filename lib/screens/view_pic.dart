import 'dart:io';

import 'package:flutter/material.dart';

class ViewPhoto extends StatelessWidget {
  final photo;
  const ViewPhoto({
    super.key,
    this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: FileImage(File(photo)))),
      ),
    );
  }
}
