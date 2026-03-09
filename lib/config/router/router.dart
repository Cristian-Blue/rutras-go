import 'package:go_router/go_router.dart';
import 'package:ruta_go/config/router/router_config.dart';
import 'package:ruta_go/config/router/router_internal.dart';
import 'package:ruta_go/presentation/shared/layout/layour.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      routes: [
        ...routerConfig.map((res) {
          return GoRoute(name: res.name, path: res.patch, builder: res.screen);
        }),
      ],
      builder: (context, state, child) {
        return Layour(title: state.topRoute?.name ?? 'general', child: child);
      },
    ),
    ...listaRoute.map(
      (res) => GoRoute(name: res.name, path: res.patch, builder: res.screen),
    ),
  ],
);
