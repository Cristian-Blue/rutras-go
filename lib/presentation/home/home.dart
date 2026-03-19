import 'package:flutter/material.dart';
import 'package:ruta_go/presentation/shared/layout/drawer_custom.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final fontStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: DrawerCustom(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Primer Parcial', style: fontStyle),
            Text('Dispositivos moviles', style: fontStyle),
            Text('03578 - Cristian Andres Afanador Delgado'),
          ],
        ),
      ),
    );
  }
}
