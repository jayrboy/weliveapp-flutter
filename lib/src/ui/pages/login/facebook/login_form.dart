import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';
import 'package:weliveapp/src/domain/repositories/session_repository.dart';
import 'package:weliveapp/src/ui/global/controllers/session_controller.dart';
import 'package:weliveapp/src/ui/pages/animated_progress_indicator.dart';
import 'package:weliveapp/src/ui/routes/routes.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LogInForm> {
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool _fetching = false;

  bool setFetching(bool value) => _fetching = value;

  double _formProgress = 0;

  void _showDashboardPage() {
    Navigator.of(context).pushNamed('/');
  }

  void _updateFormProgress() {
    var progress = 0.0;
    final controllers = [
      _usernameTextController,
      _passwordTextController,
    ];

    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  @override
  Widget build(BuildContext context) {
    const IconData facebook = IconData(0xe255, fontFamily: 'MaterialIcons');

    return Form(
      onChanged: _updateFormProgress, // NEW
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedProgressIndicator(value: _formProgress), // NEW
            SizedBox(height: 20),
            logoWeLive(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      controller: _usernameTextController,
                      decoration: const InputDecoration(hintText: 'Username'),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.lock_sharp),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      controller: _passwordTextController,
                      decoration: const InputDecoration(hintText: 'Password'),
                      obscureText: true,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Forget Password'),
                ),
                Text('|'),
                TextButton(
                  onPressed: () => Navigator.of(context).pushNamed('/register'),
                  child: Text('Register'),
                ),
              ],
            ),
            SizedBox(height: 10),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  return states.contains(MaterialState.disabled)
                      ? null
                      : Colors.white;
                }),
                backgroundColor: MaterialStateProperty.resolveWith(
                    (Set<MaterialState> states) {
                  return states.contains(MaterialState.disabled)
                      ? null
                      : Colors.deepPurpleAccent;
                }),
              ),
              onPressed: _formProgress == 1 ? _showDashboardPage : null,
              child: const Text('Login'),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    _signInWithFacebook(context);
                    setState(() {});
                  },
                  icon: Icon(
                    facebook,
                    size: 50,
                    color: Color(0xFF4267B2),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/google-logo.png',
                    width: 45,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ClipRRect logoWeLive() => ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          'assets/images/weliveapp-logo.png',
          width: 150,
          fit: BoxFit.cover,
        ),
      );

  Future<void> _signInWithFacebook(BuildContext context) async {
    // Check if the Facebook web SDK is initialized
    bool isSdkInitialized = FacebookAuth.i.isWebSdkInitialized;
    setFetching(true);
    final SessionRepository sessionRepository = context.read();
    final result = await sessionRepository.logIn();
    if (result.status == LoginStatus.success) {
      final user = await sessionRepository.user;
      if (user != null) {
        if (mounted) {
          final SessionController sessionController = context.read();
          sessionController.updateUser(user);
          Navigator.pushReplacementNamed(context, Routes.navigation);
          return;
        }
      }
    } else if (mounted) {
      ScaffoldMessenger.maybeOf(context)?.showSnackBar(
        SnackBar(
          content: Text(result.status.name),
        ),
      );
    }
    setFetching(false);
  }
}
