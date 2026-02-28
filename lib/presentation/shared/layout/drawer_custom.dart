import 'package:flutter/material.dart';
import 'package:ruta_go/config/router/router.dart';
import 'package:ruta_go/config/router/router_config.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ...routerConfig.map((res) {
            return ListTile(
              title: Text(res.title),
              onTap: () => router.go(res.patch),
              leading: Icon(res.icon),
              trailing: const Icon(Icons.arrow_forward_ios),
              subtitle: Text(res.description),
            );
          }),
        ],
      ),
    );
  }
}
