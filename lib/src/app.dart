import 'package:flutter/material.dart';
import 'package:weliveapp/src/navigation.dart';
import 'package:weliveapp/src/pages/favorites/account_page.dart';
import 'package:weliveapp/src/pages/login/login_page.dart';
import 'package:weliveapp/src/widgets/privacy_policy.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    const String login = '/';
    const String navigation = '/home';
    const String account = '/account';
    const String privacy = '/privacy';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
      ),
      routes: {
        login: (context) => LoginPage(),
        navigation: (context) => Navigation(),
        account: (context) => AccountPage(),
        privacy: (context) => PrivacyPolicy(),
      },
    );
  }
}
