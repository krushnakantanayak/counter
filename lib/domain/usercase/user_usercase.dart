import 'package:counter/data/models/user_model.dart';
import 'package:counter/data/repository/user_repository.dart';

class UserUseCases {
  final UserRepository repository;

  UserUseCases(this.repository);

  Future<UserModel?> getUser(String username) {
    return repository.getUser(username);
  }

  Future<List<UserModel>> getAllUsers() {
    return repository.getAllUsers();
  }

  Future<void> createUser(UserModel user) {
    return repository.createUser(user);
  }

  Future<void> updateUser(UserModel user) {
    return repository.updateUser(user);
  }

  Future<void> deleteUser(String username) {
    return repository.deleteUser(username);
  }
}
