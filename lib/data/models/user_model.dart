import 'package:counter/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.username, required super.counter});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'],
      counter: json['counter'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'counter': counter,
    };
  }
}
