import 'package:flutter/material.dart';
import 'package:ruta_go/presentation/shared/layout/drawer_custom.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('productos')),
      drawer: DrawerCustom(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('productos')],
        ),
      ),
    );
  }
}
