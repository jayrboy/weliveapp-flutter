import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weliveapp/src/pages/my_home_page.dart';
import 'package:weliveapp/src/pages/sign_in_page.dart';
import 'package:weliveapp/src/widgets/privacy_policy.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        ),
        routes: {
          '/': (context) => SignInPage(),
          '/home': (context) => MyHomePage(),
          '/privacy-policy': (context) => PrivacyPolicy(),
        },
      ),
    );
  }
}
