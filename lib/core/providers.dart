import 'package:counter/data/models/user_model.dart';
import 'package:counter/data/repository/user_repository.dart';
import 'package:counter/domain/usercase/user_usercase.dart';
import 'package:counter/presentation/providers/user_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = Provider((ref) => UserRepository());

final userUseCasesProvider = Provider((ref) {
  final repository = ref.read(userRepositoryProvider);
  return UserUseCases(repository);
});

final userProvider = StateNotifierProvider<UserNotifier, UserModel?>((ref) {
  final useCases = ref.read(userUseCasesProvider);
  return UserNotifier(useCases);
});
