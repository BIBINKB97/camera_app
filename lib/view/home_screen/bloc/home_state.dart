part of 'home_bloc.dart';

@immutable
class HomeState {}

class HomeInitial extends HomeState {}

class AddImageState extends HomeState {
  final File? photo;
  AddImageState({
    required this.photo,
  });
}
