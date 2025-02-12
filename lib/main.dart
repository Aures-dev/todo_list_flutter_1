import 'package:flutter/material.dart';
import 'package:todo_list_flutter_1/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 77, 76, 78)),
        useMaterial3: true,
      ),
      // home: const LoginPage(),
      initialRoute: '/',
      routes: Routes().getRoutes(),
    );
  }
}
