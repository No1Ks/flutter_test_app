import 'package:flutter_test_app/domain/models/card.dart';

typedef OnErrorCallback = void Function(Object? error);

abstract class ApiInterface {
  Future<List<CardData>?> loadData({OnErrorCallback? onError});
}