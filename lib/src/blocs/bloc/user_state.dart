part of 'user_bloc.dart';

@freezed
sealed class UserState with _$UserState {
  const factory UserState.userInitial() = UserInitial;

  const factory UserState.gettingUsers() = GettingUsers;

  const factory UserState.usersLoaded({
    required List<UserModel> users,
  }) = UsersLoaded;

  const factory UserState.getUsersError({
    required String message,
  }) = GetUsersError;
}
