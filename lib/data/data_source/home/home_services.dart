import 'package:bloc_rest_api/core/utils/http_utils/http_util.dart';
import 'package:bloc_rest_api/data/models/photo_model.dart';
import 'package:bloc_rest_api/data/models/user_model.dart';

class HomeServices {
  Future<List<UserModel>> getUsers() async {
    final _users = <UserModel>[];
    final _response = await HttpUtil.get('users');

    if ((_response as List).isEmpty) {
      return _users;
    } else {
      for (final _data in _response) {
        UserModel _userModel =
            UserModel.fromJson(_data as Map<String, dynamic>);

        _users.add(_userModel);
      }

      return _users;
    }
  }

  Future<List<PhotoModel>> getPhotos() async {
    final _photos = <PhotoModel>[];
    final _response = await HttpUtil.get('photos');

    if (_response.isEmpty) {
      return _photos;
    } else {
      for (final _data in _response as List) {
        PhotoModel _photoModel =
            PhotoModel.fromJson(_data as Map<String, dynamic>);

        _photos.add(_photoModel);
      }

      return _photos;
    }
  }
}
