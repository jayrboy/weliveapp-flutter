import 'package:flutter/material.dart';
import 'package:weliveapp/src/appbar.dart';
import 'package:weliveapp/src/pages/login/login_page.dart';
import 'package:weliveapp/src/pages/register/register_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    const String login = '/';
    const String register = '/register';
    const String navigation = '/dashboard';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
      ),
      routes: {
        login: (context) => LoginPage(),
        register: (context) => RegisterPage(),
        navigation: (context) => MyAppBar(),
      },
    );
  }
}
