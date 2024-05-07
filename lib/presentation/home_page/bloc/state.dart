import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test_app/domain/models/home.dart';

part 'state.g.dart';

@CopyWith()
class HomeState extends Equatable {
  final HomeData? data;
  final bool isLoading;
  final bool isPaginationLoading;
  final String? error;

  const HomeState({
    this.data,
    this.isLoading = false,
    this.isPaginationLoading = false,
    this.error,
  });

  @override
  List<Object?> get props => [
        data,
        isLoading,
        isPaginationLoading,
        error,
      ];
}
