import 'package:flutter/material.dart';
import 'package:weliveapp/src/widgets/navigation.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBar();
}

class _MyAppBar extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var colorScheme = Theme.of(context).colorScheme;
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        leading: Padding(
          padding: const EdgeInsets.all(1.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/we-logo.png'),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [Icon(Icons.settings)],
            ),
          ),
          TextButton(
            onPressed: () => materialAlert(
              context,
              title: 'Logout',
              content: "You want to logout of the system?",
            ),
            child: Row(
              children: [Icon(Icons.logout)],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/jay-kmutnb.jpg'),
            ),
          ),
        ],
      ),
      body: Navigation(),
    );
  }

  materialAlert(BuildContext context,
      {required String title, required String content}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pushNamed('/'),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
