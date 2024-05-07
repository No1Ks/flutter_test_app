import 'package:dio/dio.dart';
import 'package:flutter_test_app/data/dtos/characters_dto.dart';
import 'package:flutter_test_app/data/mappers/characters_mapper.dart';
import 'package:flutter_test_app/data/repositories/api_interface.dart';
import 'package:flutter_test_app/domain/models/home.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class PotterRepository extends ApiInterface {
  static final Dio _dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));

  static const String _baseUrl = 'https://api.potterdb.com';

  @override
  Future<HomeData?> loadData({
    OnErrorCallback? onError,
    String? q,
    int page = 1,
    int pageSize = 25,
  }) async {
    try {
      const String url = '$_baseUrl/v1/characters';

      final Response<dynamic> response = await _dio.get<Map<dynamic, dynamic>>(
        url,
        queryParameters: {
          'filter[name_cont]': q,
          'page[number]': page,
          'page[size]': pageSize,
        },
      );

      final CharactersDto dto = CharactersDto.fromJson(response.data as Map<String, dynamic>);
      final HomeData data = dto.toDomain();
      return data;
    } on DioException catch (e) {
      onError?.call(e.error?.toString());
      return null;
    }
  }
}
