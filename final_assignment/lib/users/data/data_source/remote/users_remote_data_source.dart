import 'package:Busx/app/constants/api_endpoint.dart';
import 'package:Busx/core/failure/failure.dart';
import 'package:Busx/core/networking/remote/http_service.dart';
import 'package:Busx/core/shared_prefs/user_shared_prefs.dart';
import 'package:Busx/users/data/data_source/dto/get_all_users_dto.dart';
import 'package:Busx/users/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final usersRemoteDataSourceProvider = Provider<UsersRemoteDataSource>(
  (ref) {
    return UsersRemoteDataSource(
      dio: ref.read(httpServiceProvider),
      userSharedPrefs: ref.read(userSharedPrefsProvider),
    );
  },
);

class UsersRemoteDataSource {
  final Dio dio;
  final UserSharedPrefs userSharedPrefs;

  UsersRemoteDataSource({
    required this.dio,
    required this.userSharedPrefs,
  });

  //get all users
  Future<Either<Failure, List<UsersEntity>>> getAllUsers(int page) async {
    try {
      String? token;
      var data = await userSharedPrefs.getUserToken();
      data.fold(
        (l) => token = null,
        (r) => token = r!,
      );

      Response response = await dio.get(
        ApiEndpoints.getAllUsers,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
        queryParameters: {
          'pageNumber': page,
          'limit': ApiEndpoints.limitPage,
        },
      );
      if (response.statusCode == 200) {
        GetAllUsersDto getAllUsersDto = GetAllUsersDto.fromJson(response.data);
        return Right(getAllUsersDto.toEntity());
      } else {
        return Left(
          Failure(
            error: response.data['message'],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.badResponse && e.response != null) {
        final errorDetails =
            e.response?.data['extraDetails'] ?? e.response?.data['message'];
        return Left(
          Failure(
            error: errorDetails ?? 'Unknown error',
            statusCode: e.response?.statusCode.toString() ?? '0',
          ),
        );
      } else {
        return Left(
          Failure(
            error: e.error.toString(),
            statusCode: e.response?.statusCode.toString() ?? '0',
          ),
        );
      }
    }
  }
}
