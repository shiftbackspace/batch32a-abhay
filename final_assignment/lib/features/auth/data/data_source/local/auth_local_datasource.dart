import 'package:dartz/dartz.dart';
import 'package:Busx/core/failure/failure.dart';
import 'package:Busx/core/networking/local/hive_service.dart';
import 'package:Busx/features/auth/data/model/auth_hive_model.dart';
import 'package:Busx/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authLocalDataSourceProvider = Provider(
  (ref) => AuthLocalDataSource(
    ref.read(hiveServiceProvider),
    ref.read(authHiveModelProvider),
  ),
);

class AuthLocalDataSource {
  final HiveService _hiveService;
  final AuthHiveModel _authHiveModel;

  AuthLocalDataSource(this._hiveService, this._authHiveModel);

  Future<Either<Failure, bool>> registerStudent(AuthEntity student) async {
    try {
      await _hiveService.addStudent(_authHiveModel.toHiveModel(student));
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }

  Future<Either<Failure, bool>> loginStudent(
    String username,
    String password,
  ) async {
    try {
      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
