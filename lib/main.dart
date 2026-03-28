import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ruta_go/config/router/router.dart';
import 'package:ruta_go/config/theme/theme.dart';
import 'package:ruta_go/provider/change_theme.dart';
import 'package:ruta_go/provider/color_change.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Ruta Go',
      theme: AppTheme(
        selectedColor: ref.watch(colorChangeProvider),
      ).themeData(ref.watch(themeDark)),
      debugShowCheckedModeBanner: false,
    );
  }
}
