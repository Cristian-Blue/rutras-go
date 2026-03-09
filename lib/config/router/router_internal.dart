import 'package:flutter/material.dart';
import 'package:ruta_go/config/router/router_model.dart';
import 'package:ruta_go/presentation/products/product_detail.dart';

List<RouterModel> listaRoute = [
  RouterModel(
    name: 'productDetail',
    screen: (context, state) {
      final int id = int.parse(state.pathParameters['id']!);
      return ProductDetail(id: id);
    },
    title: 'Product Detail',
    patch: '/product/:id',
    icon: Icons.abc,
    description: '',
  ),
];
