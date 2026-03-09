import 'package:flutter/material.dart';
import 'package:ruta_go/model/product_model.dart';
import 'package:ruta_go/service/product_service.dart';

class ProductDetail extends StatefulWidget {
  final int id;
  const ProductDetail({super.key, required this.id});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  ProductModel products = ProductModel.fromJson({});

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  void getProducts() async {
    ProductModel response = await ProductService().getProduct(widget.id);
    setState(() {
      products = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text(products.title));
  }
}
