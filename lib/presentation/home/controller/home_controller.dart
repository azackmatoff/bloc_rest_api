import 'package:bloc_rest_api/data/models/photo_model.dart';
import 'package:bloc_rest_api/data/models/user_model.dart';
import 'package:bloc_rest_api/domain/use_cases/home/get_photos_use_case.dart';
import 'package:bloc_rest_api/domain/use_cases/home/get_users_use_case.dart';
import 'package:get/get.dart';

import '../../../core/utils/di/di_locator.dart';

class HomeController extends GetxController {
  late final GetUsersUseCase _getUsersUseCase;
  late final GetPhotosUseCase _getPhotosUseCase;
  HomeController()
      : _getUsersUseCase = sl<GetUsersUseCase>(),
        _getPhotosUseCase = sl<GetPhotosUseCase>();

  static final HomeController instance = Get.find<HomeController>();

  final RxList<UserModel> _users = <UserModel>[].obs;
  final RxList<PhotoModel> _photos = <PhotoModel>[].obs;

  RxBool isLoading = false.obs;

  RxList<UserModel> get users => _users;
  RxList<PhotoModel> get photos => _photos;

  @override
  onInit() {
    getUsers();
    super.onInit();
  }

  Future<void> getUsers() async {
    isLoading.value = true;
    final _usersFromServer = await _getUsersUseCase.execute();

    if (_usersFromServer.isNotEmpty) {
      _users.value = _usersFromServer;

      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }

  Future<void> getPhotos() async {
    isLoading.value = true;
    final _photosServer = await _getPhotosUseCase.execute();

    if (_photosServer.isNotEmpty) {
      _photos.value = _photosServer;

      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }
}
