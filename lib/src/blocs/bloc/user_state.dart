part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {
  const UserInitial();
}

final class GettingUsers extends UserState {
  const GettingUsers();
}

final class UsersLoaded extends UserState {
  const UsersLoaded({
    required this.users,
  });

  final List<UserModel> users;

  @override
  List<Object> get props => [users];
}

final class GetUsersError extends UserState {
  const GetUsersError({
    required this.message,
  });

  final String message;

  @override
  List<Object> get props => [message];
}
