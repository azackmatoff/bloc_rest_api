import 'package:bloc_rest_api/data/models/photo_model.dart';
import 'package:bloc_rest_api/data/models/user_model.dart';

abstract class HomeRepository {
  Future<List<UserModel>> getUsers();
  Future<bool> deletUser(UserModel userModel);

  Future<List<PhotoModel>> getPhotos();
}
