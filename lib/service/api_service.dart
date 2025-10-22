import 'package:api_crud/models/user_models.dart';
import 'package:dio/dio.dart';

class CrudApi {
  final baseUrl = "https://684bc121ed2578be881c555f.mockapi.io/todos";
  Dio dio = Dio();

  Future<List<CrudModel>> getCrudData() async {
    try {
      final response = await dio.get(baseUrl);

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((e) => CrudModel.fromJson(e)).toList();
      } else {
        throw Exception('no data fetched');
      }
    } catch (e) {
      throw Exception('Error $e');
    }
  }

  Future addData(CrudModel crudModel) async {
    try {
      await dio.post(baseUrl, data: crudModel.toJson());
    } catch (e) {
      throw Exception('failed');
    }
  }

  Future dltCrud(String id) async {
    try {
      await dio.delete('$baseUrl/$id');
    } catch (e) {
      throw Exception('error');
    }
  }
}
