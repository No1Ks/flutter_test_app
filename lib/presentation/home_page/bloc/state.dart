import 'package:equatable/equatable.dart';
import 'package:flutter_test_app/domain/models/home.dart';

class HomeState extends Equatable {
  final HomeData? data;
  final bool isLoading;
  final bool isPaginationLoading;

  const HomeState({
    this.data,
    this.isLoading = false,
    this.isPaginationLoading = false,
  });

  HomeState copyWith({
    HomeData? data,
    bool? isLoading,
    bool? isPaginationLoading,
  }) =>
      HomeState(
        data: data ?? this.data,
        isLoading: isLoading ?? this.isLoading,
        isPaginationLoading: isPaginationLoading ?? this.isPaginationLoading,
      );

  @override
  List<Object?> get props => [
        data,
        isLoading,
        isPaginationLoading,
      ];
}
