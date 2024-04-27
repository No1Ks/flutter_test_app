import 'package:dio/dio.dart';
import 'package:flutter_test_app/data/dtos/characters_dto.dart';
import 'package:flutter_test_app/data/mappers/characters_mapper.dart';
import 'package:flutter_test_app/data/repositories/api_interface.dart';
import 'package:flutter_test_app/domain/models/card.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class PotterRepository extends ApiInterface {
  static final Dio _dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));

  static const String _baseUrl = 'https://api.potterdb.com';

  @override
  Future<List<CardData>?> loadData({String? q, OnErrorCallback? onError}) async {
    try {
      const String url = '$_baseUrl/v1/characters';

      final Response<dynamic> response = await _dio.get<Map<dynamic, dynamic>>(
        url,
        queryParameters: q != null ? {'filter[name_cont]': q} : null,
      );

      final CharactersDto dto = CharactersDto.fromJson(response.data as Map<String, dynamic>);
      final List<CardData>? data = dto.data?.map((e) => e.toDomain()).toList();
      return data;
    } on DioException catch (e) {
      onError?.call(e.response?.statusMessage);
      return null;
    }
  }
}
