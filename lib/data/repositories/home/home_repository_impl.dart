import 'package:bloc_rest_api/core/utils/di/di_locator.dart';
import 'package:bloc_rest_api/data/data_source/home/home_services.dart';
import 'package:bloc_rest_api/data/models/photo_model.dart';
import 'package:bloc_rest_api/data/models/user_model.dart';
import 'package:bloc_rest_api/domain/repository/home/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  late final HomeServices _homeServices;
  HomeRepositoryImpl() : _homeServices = sl<HomeServices>();

  @override
  Future<List<UserModel>> getUsers() async {
    return _homeServices.getUsers();
  }

  @override
  Future<bool> deletUser(UserModel userModel) async {
    // TODO: implement deletUser
    throw UnimplementedError();
  }

  @override
  Future<List<PhotoModel>> getPhotos() async {
    return _homeServices.getPhotos();
  }
}
