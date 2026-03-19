import 'package:flutter/material.dart';
import 'package:ruta_go/config/router/router_model.dart';
import 'package:ruta_go/presentation/home/home.dart';
import 'package:ruta_go/presentation/naruto/naruto.dart';
import 'package:ruta_go/presentation/pokemon/pokemon.dart';
import 'package:ruta_go/presentation/products/products.dart';
import 'package:ruta_go/presentation/settings/settings.dart';

List<RouterModel> routerConfig = [
  RouterModel(
    name: 'home',
    screen: (context, state) => Home(),
    title: 'Home',
    patch: '/',
    icon: Icons.home,
    description: 'Home',
    inDrawer: true,
  ),
  /*
  RouterModel(
    name: 'naruto',
    screen: (context, state) => const Naruto(),
    title: 'Naruto',
    patch: '/naruto',
    icon: Icons.home,
    description: 'Naruto',
    inDrawer: true,
  ),
  RouterModel(
    name: 'pokemon',
    screen: (context, state) => const Pokemon(),
    title: 'Pokemon',
    patch: '/pokemon',
    icon: Icons.abc,
    description: 'Pokemon',
    inDrawer: true,
  ),
  RouterModel(
    name: 'settings',
    screen: (context, state) => const Settings(),
    title: 'Settings',
    patch: '/settings',
    icon: Icons.abc,
    description: 'Settings',
    inDrawer: true,
  ),*/
  RouterModel(
    name: 'products',
    screen: (context, state) => const Products(),
    title: 'Products',
    patch: '/products',
    icon: Icons.abc,
    description: 'Products',
    inDrawer: true,
  ),
];
