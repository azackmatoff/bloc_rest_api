import 'dart:developer';

import 'package:bloc_rest_api/data/data_source/home/home_services.dart';
import 'package:bloc_rest_api/data/repositories/home/home_repository_impl.dart';
import 'package:bloc_rest_api/domain/use_cases/home/get_photos_use_case.dart';
import 'package:bloc_rest_api/domain/use_cases/home/get_users_use_case.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  _initServices();
  _initRepositories();
  _initUseCases();
}

void _initRepositories() {
  log('_initRepositories......');
  sl.registerSingleton<HomeRepositoryImpl>(HomeRepositoryImpl());
}

void _initServices() {
  log('_initServices......');
  sl.registerSingleton<HomeServices>(HomeServices());
}

void _initUseCases() {
  sl.registerSingleton<GetUsersUseCase>(GetUsersUseCase());
  sl.registerSingleton<GetPhotosUseCase>(GetPhotosUseCase());
}
