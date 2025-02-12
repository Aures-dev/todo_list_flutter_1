import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_list_flutter_1/screen/login_page.dart';
import 'package:todo_list_flutter_1/screen/my_home_page.dart';

class Routing {
  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return PageTransition(
            type: PageTransitionType.bottomToTop,
            duration: Duration(milliseconds: 2000),
            child: const LoginPage());
      case '/login':
        return PageTransition(
            type: PageTransitionType.bottomToTop,
            duration: Duration(milliseconds: 2000),
            child: const LoginPage());
      // case '/register':
      //   return PageTransition(
      //       type: PageTransitionType.topToBottom,
      //       duration: Duration(milliseconds: 2000),
      //       child: const RegisterPage());
      case '/home':
        return PageTransition(
            type: PageTransitionType.rightToLeft,
            duration: Duration(milliseconds: 2000),
            child: const MyHomePage());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text("La route n'existe pas !!"),
                  ),
                ));
    }
  }
}
