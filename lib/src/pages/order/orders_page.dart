import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.local_grocery_store,
            size: 100,
          ),
          Text('Orders Page', textScaleFactor: 2.5),
        ],
      ),
    );
  }
}
