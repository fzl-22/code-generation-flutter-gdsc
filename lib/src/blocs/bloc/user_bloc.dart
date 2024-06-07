import 'package:bloc/bloc.dart';
import 'package:code_generation_flutter/src/data/models/user_model.dart';
import 'package:code_generation_flutter/src/data/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({
    required UserRepository repository,
  })  : _repository = repository,
        super(const UserInitial()) {
    on<GetUsersEvent>(_getUsersHandler);
  }

  final UserRepository _repository;

  Future<void> _getUsersHandler(
    GetUsersEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const GettingUsers());

    final result = await _repository.getUsers();

    result.fold(
      (failure) => emit(GetUsersError(message: failure.errorMessage)),
      (users) => emit(UsersLoaded(users: users)),
    );
  }
}
