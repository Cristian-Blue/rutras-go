import 'package:go_router/go_router.dart';
import 'package:ruta_go/config/router/router_config.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    ...routerConfig.map((res) {
      return GoRoute(name: res.name, path: res.patch, builder: res.screen);
    }),
  ],
);
