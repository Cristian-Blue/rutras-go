import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ruta_go/config/router/router.dart';
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
      appBar: AppBar(title: const Text('Productos')),
      drawer: DrawerCustom(),
      body: Center(
        child: FutureBuilder(
          future: ProductService().getProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text("Error"));
            } else if (snapshot.hasData) {
              final data = snapshot.data;
              products = data as List<ProductModel>;

              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () => router.push('/product/${products[index].id}'),
                    title: Text(products[index].title),
                    subtitle: Text(products[index].description),
                    leading: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(products[index].images[0]),
                      backgroundColor: Colors.transparent,
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: const Color.fromARGB(255, 228, 228, 228),
                        width: 1,
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text("No data"));
            }
          },
        ),
      ),
    );
  }
}
