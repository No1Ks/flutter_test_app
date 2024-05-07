import 'package:equatable/equatable.dart';
import 'package:flutter_test_app/domain/models/home.dart';

class HomeState extends Equatable {
  final HomeData? data;
  final bool isLoading;

  const HomeState({
    this.data,
    this.isLoading = false,
  });

  HomeState copyWith({
    HomeData? data,
    bool? isLoading,
  }) =>
      HomeState(
        data: data ?? this.data,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object?> get props => [
        data,
        isLoading,
      ];
}
