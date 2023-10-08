import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 100,
          ),
          Text('Store Page', textScaleFactor: 2.5),
        ],
      ),
    );
  }
}
