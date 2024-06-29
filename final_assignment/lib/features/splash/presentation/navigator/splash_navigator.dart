import 'package:Busx/features/auth/presentation/navigator/login_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashViewNavigatorProvider =
    Provider<SplashViewNavigator>((ref) => SplashViewNavigator());

//this class will be used to navigate to LoginView
class SplashViewNavigator with LoginViewRoute {}

mixin SplashViewRoute {}
