import 'package:flutter/material.dart';
import 'package:weliveapp/src/widgets/animated_progress_indicator.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<RegisterForm> {
  final _fullnameTextController = TextEditingController();
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _cfpasswordTextController = TextEditingController();
  final _emailTextController = TextEditingController();

  double _formProgress = 0;

  void _showDashboard() {
    Navigator.of(context).pushNamed('/dashboard');
  }

  void _updateFormProgress() {
    var progress = 0.0;
    final controllers = [
      _fullnameTextController,
      _usernameTextController,
      _passwordTextController,
      _cfpasswordTextController,
      _emailTextController,
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
    return Form(
      onChanged: _updateFormProgress, // NEW
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedProgressIndicator(value: _formProgress), // NEW
            SizedBox(height: 10),
            Text(
              'Register',
              textScaleFactor: 2.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _fullnameTextController,
                decoration: const InputDecoration(hintText: 'Full Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _usernameTextController,
                decoration: const InputDecoration(hintText: 'Username'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _passwordTextController,
                decoration: const InputDecoration(hintText: 'Password'),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _cfpasswordTextController,
                decoration: const InputDecoration(hintText: 'Confirm Password'),
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextFormField(
                controller: _emailTextController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Login')),
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
                  onPressed: _formProgress == 1 ? _showDashboard : null,
                  child: const Text('Enter'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
