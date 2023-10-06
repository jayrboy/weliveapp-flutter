import 'package:flutter/material.dart';

class CustomerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.people,
            size: 100,
          ),
          Text('Customer Page', textScaleFactor: 2.5),
        ],
      ),
    );
  }
}
