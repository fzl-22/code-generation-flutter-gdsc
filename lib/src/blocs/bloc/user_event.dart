part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

final class GetUsersEvent extends UserEvent {
  const GetUsersEvent();
}
