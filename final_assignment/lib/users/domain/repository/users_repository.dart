
import 'package:Busx/core/failure/failure.dart';
import 'package:Busx/users/data/repository/users_remote_repository.dart';
import 'package:Busx/users/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final usersRepositoryProvider = Provider<IUsersRepository>((ref) {
  return ref.read(usersRemoteRepositoryProvider);
});

abstract class IUsersRepository{
  Future<Either<Failure, List<UsersEntity>>> getAllUsers(int page);
}