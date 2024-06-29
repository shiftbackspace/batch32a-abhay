import 'package:Busx/core/common/my_snackbar.dart';
import 'package:Busx/features/home/presentation/navigator/home_view_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeViewModelProvider = StateNotifierProvider<HomeViewModel, bool>(
  (ref) => HomeViewModel(ref.read(homeViewNavigatorProvider)),
);

class HomeViewModel extends StateNotifier<bool> {
  HomeViewModel(this.homeNavigator) : super(false);
  final HomeViewNavigator homeNavigator;

  void logout() async {
    showMySnackBar(
        message: 'Logging out....',
        color: const Color.fromARGB(255, 218, 38, 25));
    await Future.delayed(const Duration(seconds: 1));
    openLoginView();
  }

  openLoginView() {
    homeNavigator.openLoginView();
  }
}
