import 'package:flutter/material.dart';
import 'package:ruta_go/config/router/router.dart';
import 'package:ruta_go/model/product_model.dart';
import 'package:ruta_go/service/product_service.dart';

class ProductDetail extends StatefulWidget {
  final int id;

  const ProductDetail({super.key, required this.id});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  ProductModel? product;
  bool isLoading = true;
  bool hasError = false;
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  Future<void> getProduct() async {
    try {
      ProductModel response = await ProductService().getProduct(widget.id);

      setState(() {
        product = response;
        isLoading = false;
        imageUrl = response!.images.first;
      });
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (hasError) {
      return const Scaffold(
        body: Center(child: Text("Error cargando producto")),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// IMAGEN CON PLACEHOLDER
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(15),
                ),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/img/Loading_icon.gif',
                  image: imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return const SizedBox(
                      height: 250,
                      child: Center(child: Icon(Icons.broken_image, size: 50)),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              /// CONTENIDO
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TITULO
                    Text(
                      product!.title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// PRECIO
                    Text(
                      "\$${product!.price}",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// DESCRIPCIÓN
                    Text(
                      product!.description,
                      style: const TextStyle(fontSize: 15, height: 1.4),
                    ),

                    const SizedBox(height: 30),
                    Chip(
                      avatar: ClipOval(
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/img/Loading_icon.gif',
                          image: product!.category.image,
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                      ),
                      label: Text(product!.category.name),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        alignment: WrapAlignment.center,
                        children: [
                          ...product!.images.map((image) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  imageUrl = image;
                                });
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/img/Loading_icon.gif',
                                  image: image,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: FilledButton(
                        onPressed: () => router.pop(),
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Volver',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
