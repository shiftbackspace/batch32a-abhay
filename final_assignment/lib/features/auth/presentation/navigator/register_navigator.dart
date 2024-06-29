import 'package:Busx/app/navigator/navigator.dart';
import 'package:Busx/features/auth/presentation/view/register_view.dart';

//route
class RegisterViewNavigator {}

//mixin
mixin RegisterViewRoute {
  openRegisterView() {
    NavigateRoute.pushRoute(const RegisterView());
  }
}
