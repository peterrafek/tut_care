import 'package:flutter/material.dart';
import 'package:tut_care/core/router/route_names.dart';
import 'package:tut_care/presention/auth/login/views/login_view.dart';

abstract class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      default:
        return null;
    }
  }
}