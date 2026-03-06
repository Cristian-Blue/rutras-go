import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ruta_go/model/product_model.dart';
import 'package:ruta_go/presentation/shared/layout/drawer_custom.dart';
import 'package:ruta_go/service/product_service.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<ProductModel> products = [];

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  void getProducts() async {
    final List<ProductModel> response = await ProductService().getProducts();
    setState(() {
      products = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('productos')),
      drawer: DrawerCustom(),
      body: Center(
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(products[index].title),
              subtitle: Text(products[index].description),
            );
          },
        ),
      ),
    );
  }
}
