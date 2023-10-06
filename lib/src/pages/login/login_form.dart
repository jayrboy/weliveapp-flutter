import 'package:flutter/material.dart';
import 'package:weliveapp/src/widgets/animated_progress_indicator.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LogInForm> {
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  double _formProgress = 0;

  void _showMyHomePage() {
    Navigator.of(context).pushNamed('/dashboard');
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
            SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'assets/images/weliveapp-logo.png',
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      controller: _usernameTextController,
                      decoration: const InputDecoration(hintText: 'Username'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/images/g-logo.png',
                        width: 45,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  onPressed: () {},
                  icon: Container(
                    child: Icon(
                      facebook,
                      size: 55,
                      color: Color(0xFF4267B2),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
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
              onPressed: _formProgress == 1 ? _showMyHomePage : null,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
