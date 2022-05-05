import 'package:bloc/bloc.dart';
import 'package:bloc_rest_api/core/utils/di/di_locator.dart';
import 'package:bloc_rest_api/data/models/user_model.dart';
import 'package:bloc_rest_api/domain/use_cases/home/get_photos_use_case.dart';
import 'package:bloc_rest_api/domain/use_cases/home/get_users_use_case.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late final GetUsersUseCase _getUsersUseCase;
  late final GetPhotosUseCase _getPhotosUseCase;

  HomeBloc()
      : _getUsersUseCase = sl<GetUsersUseCase>(),
        _getPhotosUseCase = sl<GetPhotosUseCase>(),
        super(HomeInitial()) {
    on<GetUsersEvent>(_onGetUsersEvent);
  }

  Future<void> _onGetUsersEvent(event, emit) async {
    List<UserModel> _users = await _getUsersUseCase.execute();
    emit(HomeLoaded(_users));
  }
}
