import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class GalleryModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String photo;

  GalleryModel({required this.photo});
}
