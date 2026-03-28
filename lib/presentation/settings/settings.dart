import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_go/presentation/shared/layout/drawer_custom.dart';
import 'package:ruta_go/provider/change_theme.dart';
import 'package:ruta_go/provider/color_change.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTheme = ref.watch(themeDark);

    return Scaffold(
      drawer: DrawerCustom(),
      appBar: AppBar(title: const Text('settings')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('settings'),
            RadioListTile<int>(
              title: Text("Light"),
              value: 0,
              groupValue: selectedTheme,
              onChanged: (value) {
                ref.read(themeDark.notifier).state = value!;
              },
            ),
            RadioListTile<int>(
              title: Text("Dark"),
              value: 1,
              groupValue: selectedTheme,
              onChanged: (value) {
                ref.read(themeDark.notifier).state = value!;
              },
            ),

            RadioGroup(
              onChanged: (value) {},
              child: Column(
                children: [
                  ListTile(
                    title: Text('Color 0'),
                    onTap: () {
                      ref.read(colorChangeProvider.notifier).changeColor(0);
                    },
                  ),
                  ListTile(
                    title: Text('Color 1'),
                    onTap: () {
                      ref.read(colorChangeProvider.notifier).changeColor(1);
                    },
                  ),
                  ListTile(
                    title: Text('Color 2'),
                    onTap: () {
                      ref.read(colorChangeProvider.notifier).changeColor(2);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
