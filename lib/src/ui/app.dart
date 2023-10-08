import 'package:flutter/material.dart';
import 'package:weliveapp/src/ui/routes/app_routes.dart';
import 'package:weliveapp/src/ui/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return FutureBuilder<bool>(
      future: () async {
        // final sessionRepository = Provider.of<SessionRepository>(context);
        // final user = await sessionRepository.user;
        // if (user != null) {
        //   // ignore: use_build_context_synchronously
        //   context.read<SessionController>().updateUser(user);
        //   return true;
        // }
        return false;
      }.call(),
      builder: (_, snapShot) {
        if (!snapShot.hasData) {
          return const MediaQuery(
            data: MediaQueryData(),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Material(
                color: Colors.white,
                child: SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          );
        }
        return MaterialApp(
          title: 'We Live App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            colorScheme:
                ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
          ),
          routes: appRoutes,
          initialRoute: snapShot.data! ? Routes.navigation : Routes.login,
        );
      },
    );
  }
}
