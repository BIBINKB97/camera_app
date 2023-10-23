import 'dart:io';
import 'package:camera_app/database/db_functions.dart';
import 'package:camera_app/screens/view_pic.dart';
import 'package:flutter/material.dart';

class Galley extends StatelessWidget {
  const Galley({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: galleryListNotifier,
      builder: (context, value, child) => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, mainAxisExtent: 120),
        itemCount: value.length,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.black87,
            width: 0.8,
          )),
          child: GestureDetector(
            child: Image(
              image: FileImage(File(value[index].photo)),
              fit: BoxFit.fill,
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ViewPhoto(
                        photo: value[index].photo,
                      )));
            },
            onLongPress: () {
              showDialog(
                context: context,
                builder: ((context) {
                  return Padding(
                    padding: EdgeInsets.all(20.0),
                    child: AlertDialog(
                      backgroundColor: Colors.white,
                      title: Text(
                        'Alert !!',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 25,
                            fontWeight: FontWeight.w600),
                      ),
                      content: Text(
                        "Do you want to delete this File ?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        TextButton(
                          onPressed: (() {
                            yesOrNo(context);
                            deletePhoto(index);
                          }),
                          child: Text(
                            'Yes',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ),
                        TextButton(
                            onPressed: (() {
                              yesOrNo(context);
                            }),
                            child: Text('No',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)))
                      ],
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }

  yesOrNo(BuildContext context) {
    return Navigator.of(context).pop();
  }
}
