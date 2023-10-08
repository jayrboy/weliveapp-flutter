import 'package:flutter/material.dart';
import 'package:weliveapp/src/ui/appbar.dart';
import 'package:weliveapp/src/ui/pages/login/facebook/facebook_login.dart';
import 'package:weliveapp/src/ui/pages/login/login_page.dart';
import 'package:weliveapp/src/ui/pages/register/register_page.dart';
import 'package:weliveapp/src/ui/routes/routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.login: (_) => const LoginPage(),
    Routes.register: (_) => const RegisterPage(),
    Routes.facebook: (_) => const FacebookLogin(),
    Routes.navigation: (_) => const MyAppBar(),
  };
}
