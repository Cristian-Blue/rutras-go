import 'package:flutter/material.dart';
import 'package:ruta_go/presentation/shared/layout/drawer_custom.dart';

class Naruto extends StatelessWidget {
  const Naruto({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('naruto')),
      drawer: DrawerCustom(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('naruto')],
        ),
      ),
    );
  }
}
