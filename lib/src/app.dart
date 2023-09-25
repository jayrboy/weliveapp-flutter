import 'package:flutter/material.dart';
import 'package:weliveapp/src/navigation.dart';
import 'package:weliveapp/src/pages/favorites/favorites_page.dart';
import 'package:weliveapp/src/pages/login/login_page.dart';
import 'package:weliveapp/src/widgets/privacy_policy.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    const String login = '/';
    const String home = '/home';

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
      ),
      routes: {
        login: (context) => LoginPage(),
        home: (context) => Navigation(),
        '/privacy-policy': (context) => PrivacyPolicy(),
        '/favorites': (context) => FavoritesPage(),
      },
    );
  }
}
