import 'package:flutter/material.dart';

class ProblemPage extends StatelessWidget {
  const ProblemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.help,
            size: 100,
          ),
          Text('Problem Page', textScaleFactor: 2.5),
        ],
      ),
    );
  }
}
