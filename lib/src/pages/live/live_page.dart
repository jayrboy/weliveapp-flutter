import 'package:flutter/material.dart';

class LivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.facebook,
            size: 100,
          ),
          Text('Facebook Live Page', textScaleFactor: 2.5),
        ],
      ),
    );
  }
}
