import 'package:bloc_rest_api/core/usecase/use_case.dart';
import 'package:bloc_rest_api/core/utils/di/di_locator.dart';
import 'package:bloc_rest_api/data/models/user_model.dart';
import 'package:bloc_rest_api/data/repositories/home/home_repository_impl.dart';

class GetUsersUseCase implements UseCase<List<UserModel>, void> {
  final HomeRepositoryImpl _homeRepositoryImpl;

  GetUsersUseCase() : _homeRepositoryImpl = sl<HomeRepositoryImpl>();
  @override
  Future<List<UserModel>> execute({params}) {
    return _homeRepositoryImpl.getUsers();
  }
}
