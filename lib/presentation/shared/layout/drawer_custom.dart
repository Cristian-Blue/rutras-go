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
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset('assets/img/back.jpeg').image,
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 64,
                  width: 64,
                  child: CircleAvatar(
                    child: Image.asset('assets/img/user-2.png'),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cristian Afanador',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Ingeniero de sistemas',
                      style: TextStyle(
                        fontSize: 12,
                        color: const Color.fromARGB(255, 217, 217, 217),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
