import 'package:dio/dio.dart';
import 'package:ruta_go/model/dbz_model.dart';

class DbzService {
  final Dio _dio = Dio();

  Future<List<DbzModel>> getDbz(int page, {int limit = 10}) async {
    final response = await _dio.get(
      'https://dragonball-api.com/api/characters?page=$page&limit=$limit',
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data['items'];

      return data.map((e) => DbzModel.fromJson(e)).toList();
    }

    return [];
  }
}
