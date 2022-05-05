part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  late List<UserModel> users;
  HomeLoaded(this.users);
}
