import 'package:Busx/core/failure/failure.dart';
import 'package:Busx/users/data/data_source/remote/users_remote_data_source.dart';
import 'package:Busx/users/domain/entity/user_entity.dart';
import 'package:Busx/users/domain/repository/users_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:final_assignment/core/failure/failure.dart';
import 'package:final_assignment/features/users/data/data_source/remote/users_remote_data_source.dart';
import 'package:final_assignment/features/users/domain/entity/user_entity.dart';
import 'package:final_assignment/features/users/domain/repository/users_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final usersRemoteRepositoryProvider = Provider<IUsersRepository>((ref) {
  return UsersRemoteRepository(
    ref.read(usersRemoteDataSourceProvider),
  );
});

class UsersRemoteRepository implements IUsersRepository{
  final UsersRemoteDataSource _usersRemoteDataSource;

  UsersRemoteRepository(this._usersRemoteDataSource);

  @override
  Future<Either<Failure, List<UsersEntity>>> getAllUsers(int page) {
   return _usersRemoteDataSource.getAllUsers(page);
  }


}
