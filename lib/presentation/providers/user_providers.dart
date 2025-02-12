import 'package:counter/data/models/user_model.dart';
import 'package:counter/data/repository/user_repository.dart';
import 'package:counter/domain/usercase/user_usercase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});

final userUseCasesProvider = Provider<UserUseCases>((ref) {
  return UserUseCases(ref.read(userRepositoryProvider));
});

final userProvider = StateNotifierProvider<UserNotifier, UserModel?>((ref) {
  return UserNotifier(ref.read(userUseCasesProvider));
});

class UserNotifier extends StateNotifier<UserModel?> {
  final UserUseCases _userUseCases;

  UserNotifier(this._userUseCases) : super(null);

  Future<void> loadUser(String username) async {
    state = await _userUseCases.getUser(username);
  }

  Future<void> createUser(String username) async {
    final user = UserModel(username: username, counter: 0);
    await _userUseCases.createUser(user);
    state = user;
  }

  Future<void> incrementCounter() async {
    if (state != null) {
      final updatedUser =
          UserModel(username: state!.username, counter: state!.counter + 1);
      await _userUseCases.updateUser(updatedUser);
      state = updatedUser;
    }
  }

  Future<void> decrementCounter() async {
    if (state != null) {
      final updatedUser =
          UserModel(username: state!.username, counter: state!.counter - 1);
      await _userUseCases.updateUser(updatedUser);
      state = updatedUser;
    }
  }

  Future<void> deleteUser() async {
    if (state != null) {
      await _userUseCases.deleteUser(state!.username);
      state = null;
    }
  }
}
