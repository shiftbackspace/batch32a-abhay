

import 'package:Busx/app/navigator/navigator.dart';
import 'package:Busx/users/presentation/view/user_view.dart';
';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userNavigatorProvider = Provider((ref) => UserNavigator());

class UserNavigator{}

mixin UserViewRoute {
  openUserView() {
    NavigateRoute.popAndPushRoute(const UserView());
  }
}