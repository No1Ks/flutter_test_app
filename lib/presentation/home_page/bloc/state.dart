import 'package:equatable/equatable.dart';
import 'package:flutter_test_app/domain/models/card.dart';

class HomeState extends Equatable {
  final Future<List<CardData>?>? data;

  const HomeState({this.data});

  HomeState copyWith({Future<List<CardData>?>? data}) => HomeState(data: data ?? this.data);

  @override
  List<Object?> get props => [data];
}
