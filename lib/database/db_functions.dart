// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:camera_app/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<GalleryModel>> galleryListNotifier = ValueNotifier([]);

Future<void> addPhoto(GalleryModel value) async {
  final photoDb = await Hive.openBox<GalleryModel>('DB');
  value.id = await photoDb.add(value);
  photoDb.put(value.id, value);
  getFromHive();
}

Future<void> getFromHive() async {
  final photoDb = await Hive.openBox<GalleryModel>('DB');
  galleryListNotifier.value.clear();
  galleryListNotifier.value.addAll(photoDb.values);
  galleryListNotifier.notifyListeners();
}

Future<void> deletePhoto(id) async {
  final photoDb = await Hive.openBox<GalleryModel>('DB');
  await photoDb.deleteAt(id);
  getFromHive();
}
