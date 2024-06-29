import 'package:Busx/core/failure/failure.dart';
import 'package:Busx/users/domain/entity/user_entity.dart';
import 'package:Busx/users/domain/repository/users_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final usersUsecaseProvider = Provider<UsersUsecase>(
  (ref) => UsersUsecase(
    usersRepository: ref.read(usersRepositoryProvider),
  ),
);

class UsersUsecase {
  final IUsersRepository usersRepository;

  UsersUsecase({required this.usersRepository});

  Future<Either<Failure, List<UsersEntity>>> getAllUsers(int page) async {
    return usersRepository.getAllUsers(page);
  }
}
