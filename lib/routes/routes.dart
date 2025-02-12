import 'package:flutter/material.dart';
import 'package:todo_list_flutter_1/screen/login_page.dart';
import 'package:todo_list_flutter_1/screen/my_home_page.dart';
import 'package:todo_list_flutter_1/screen/register_page.dart';

class Routes {
  final Map<String, WidgetBuilder> _routes = {
    '/': (context) => const LoginPage(),
    '/register': (context) => const RegisterPage(),
    '/home': (context) => const MyHomePage(),
  };

  Map<String, WidgetBuilder> getRoutes() {
    return _routes;
  }
}
