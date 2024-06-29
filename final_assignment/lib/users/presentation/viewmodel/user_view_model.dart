import 'package:Busx/core/common/my_snackbar.dart';
import 'package:Busx/users/domain/usecases/users_usecase.dart';
import 'package:Busx/users/presentation/state/user_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userViewModelProvider =
    StateNotifierProvider<UserViewModel, UserState>((ref) {
  final usersUsecase = ref.read(usersUsecaseProvider);
  return UserViewModel(usersUsecase);
});

class UserViewModel extends StateNotifier<UserState> {
  UserViewModel(this.usersUsecase) : super(UserState.initial()) {
    getAllUsers();
  }

  final UsersUsecase usersUsecase;

  Future resetState() async {
    state = UserState.initial();
    getAllUsers();
  }

  getAllUsers() async {
    state = state.copyWith(isLoading: true);
    final currentState = state;
    final users = currentState.lstUsers;
    final page = currentState.page + 1;
    final hasReachedMax = currentState.hasReachedMax;
    if (!hasReachedMax) {
      var data = await usersUsecase.getAllUsers(page);
      data.fold((l) {
        state = state.copyWith(
            isLoading: false, hasReachedMax: true, errorMessage: l.error);
        showMySnackBar(message: l.error, color: Colors.red);
      }, (r) {
        if (r.isEmpty) {
          state = state.copyWith(isLoading: false, hasReachedMax: true);
          showMySnackBar(message: 'No more users', color: Colors.red);
        } else {
          state = state.copyWith(
              isLoading: false, page: page, lstUsers: [...users, ...r]);
        }
      });
    }
  }
}
