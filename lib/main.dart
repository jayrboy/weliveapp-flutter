import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';
import 'package:weliveapp/src/data/repositories_impl/session_repository_impl.dart';
import 'package:weliveapp/src/domain/repositories/session_repository.dart';
import 'package:weliveapp/src/ui/app.dart';
import 'package:weliveapp/src/ui/global/controllers/session_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // device orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // *bug* FirebaseOptions cannot be null when creating the default app.
  await Firebase.initializeApp();

  // check if is running on Web
  if (kIsWeb) {
    // initialize the facebook javascript SDK
    await FacebookAuth.instance.webAndDesktopInitialize(
      appId: "167069756456126",
      cookie: true,
      xfbml: true,
      version: "v18.0",
    );
  }

  runApp(
    MultiProvider(
      providers: [
        Provider<SessionRepository>(
          create: (_) => SessionRepositoryImpl(FacebookAuth.i),
        ),
        Provider<SessionController>(
          create: (_) => SessionController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
