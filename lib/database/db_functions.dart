import 'package:camera_app/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<GalleryModel>> galleryListNotifier = ValueNotifier([]);

Future<void> addPhoto(GalleryModel value) async {
  final photoDb = await Hive.openBox<GalleryModel>('Database');
  value.id = await photoDb.add(value);
  photoDb.put(value.id, value);
  getFromHive();
}

Future<void> getFromHive() async {
  final photoDb = await Hive.openBox<GalleryModel>('Database');
  galleryListNotifier.value.clear();
  galleryListNotifier.value.addAll(photoDb.values);
  galleryListNotifier.notifyListeners();
}

Future<void> deletePhoto(id) async {
  final photoDb = await Hive.openBox<GalleryModel>('Database');
  await photoDb.deleteAt(id);
  getFromHive();
}
Future<void>viewPhoto(id) async{
  
}