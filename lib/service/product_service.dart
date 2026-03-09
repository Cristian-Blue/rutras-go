import 'package:dio/dio.dart';
import 'package:ruta_go/const/product_cons.dart';
import 'package:ruta_go/model/product_model.dart';

class ProductService {
  Future<List<ProductModel>> getProducts() async {
    final dio = Dio();
    final response = await dio.get(GET_PRODUCTS);
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((e) => ProductModel.fromJson(e)).toList();
    }
    return [];
  }

  Future<ProductModel> getProduct(int id) async {
    final dio = Dio();
    final response = await dio.get('$GET_PRODUCTS/$id');
    if (response.statusCode == 200) {
      return ProductModel.fromJson(response.data);
    }
    return ProductModel.fromJson({});
  }
}
