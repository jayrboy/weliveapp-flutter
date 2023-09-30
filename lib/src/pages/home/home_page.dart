import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.favorite;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          FlutterLogo(size: 100),
          Text('Home Page', textScaleFactor: 2.5),
        ],
      ),
    );
  }
}
