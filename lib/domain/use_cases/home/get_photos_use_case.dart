import 'package:bloc_rest_api/core/usecase/use_case.dart';
import 'package:bloc_rest_api/data/models/photo_model.dart';
import 'package:bloc_rest_api/data/repositories/home/home_repository_impl.dart';

import '../../../core/utils/di/di_locator.dart';

class GetPhotosUseCase implements UseCase<List<PhotoModel>, void> {
  late final HomeRepositoryImpl _homeRepositoryImpl;

  GetPhotosUseCase() : _homeRepositoryImpl = sl<HomeRepositoryImpl>();
  @override
  Future<List<PhotoModel>> execute({void params}) {
    return _homeRepositoryImpl.getPhotos();
  }
}
