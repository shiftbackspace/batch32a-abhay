import 'package:Busx/users/domain/entity/user_entity.dart';


class UserState {
  final List<UsersEntity> lstUsers;
  final bool hasReachedMax;
  final int page;
  final bool isLoading;
  final String? errorMessage;

  UserState({
    required this.lstUsers,
    required this.isLoading,
    required this.page,
    required this.hasReachedMax,
    this.errorMessage,
  });

  factory UserState.initial() {
    return UserState(
      lstUsers: [],
      hasReachedMax: false,
      page: 0,
      isLoading: false,
      errorMessage: null,
    );
  }

  UserState copyWith({
    List<UsersEntity>? lstUsers,
    bool? isLoading,
    bool? hasReachedMax,
    int? page,
    String? errorMessage,
  }) {
    return UserState(
      lstUsers: lstUsers ?? this.lstUsers,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

}
