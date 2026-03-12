import 'package:api_revision/utils/RoutesFolder/routes_name.dart';
import 'package:api_revision/view/home_view.dart';
import 'package:api_revision/view/login_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> navigationRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => HomeView());

      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => LoginView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text("No Routes"))),
        );
    }
  }
}
