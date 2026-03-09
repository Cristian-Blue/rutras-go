import 'package:flutter/material.dart';

class Layour extends StatelessWidget {
  final String title;
  final Widget child;
  const Layour({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),

      body: Column(
        children: [
          Text('Esto es del layout'),
          Expanded(child: child),
        ],
      ),
    );
  }
}
