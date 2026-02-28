import 'package:flutter/material.dart';
import 'package:ruta_go/presentation/shared/layout/drawer_custom.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerCustom(),
      appBar: AppBar(title: const Text('settings')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('settings')],
        ),
      ),
    );
  }
}
