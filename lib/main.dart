import 'package:camera_app/database/db_functions.dart';
import 'package:camera_app/screens/home_screen/home.dart';
import 'package:camera_app/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(GalleryModelAdapter().typeId)) {
    Hive.registerAdapter(GalleryModelAdapter());
  }
  getFromHive();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'camera app',
      home: HomePage(),
    );
  }
}
