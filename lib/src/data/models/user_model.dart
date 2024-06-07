import 'dart:convert';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      email: map['email'] as String,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      avatar: map['avatar'] as String,
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserModel copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'UserModel(id: $id, email: $email, firstName: $firstName, '
        'lastName: $lastName, avatar: $avatar)';
  }

  @override
  List<Object> get props => [id];
}
