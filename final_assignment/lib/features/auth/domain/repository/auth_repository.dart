import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:Busx/core/failure/failure.dart';
import 'package:Busx/features/auth/data/repository/remote/auth_remote_repository.dart';
import 'package:Busx/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return ref.read(authRemoteRepositoryProvider);
});

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerStudent(AuthEntity student);
  Future<Either<Failure, bool>> loginStudent(String username, String password);
  Future<Either<Failure, String>> uploadProfilePicture(File file);
}
