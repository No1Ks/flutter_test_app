// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HomeStateCWProxy {
  HomeState data(HomeData? data);

  HomeState isLoading(bool isLoading);

  HomeState isPaginationLoading(bool isPaginationLoading);

  HomeState error(String? error);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeState call({
    HomeData? data,
    bool? isLoading,
    bool? isPaginationLoading,
    String? error,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHomeState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHomeState.copyWith.fieldName(...)`
class _$HomeStateCWProxyImpl implements _$HomeStateCWProxy {
  const _$HomeStateCWProxyImpl(this._value);

  final HomeState _value;

  @override
  HomeState data(HomeData? data) => this(data: data);

  @override
  HomeState isLoading(bool isLoading) => this(isLoading: isLoading);

  @override
  HomeState isPaginationLoading(bool isPaginationLoading) =>
      this(isPaginationLoading: isPaginationLoading);

  @override
  HomeState error(String? error) => this(error: error);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeState call({
    Object? data = const $CopyWithPlaceholder(),
    Object? isLoading = const $CopyWithPlaceholder(),
    Object? isPaginationLoading = const $CopyWithPlaceholder(),
    Object? error = const $CopyWithPlaceholder(),
  }) {
    return HomeState(
      data: data == const $CopyWithPlaceholder()
          ? _value.data
          // ignore: cast_nullable_to_non_nullable
          : data as HomeData?,
      isLoading: isLoading == const $CopyWithPlaceholder() || isLoading == null
          ? _value.isLoading
          // ignore: cast_nullable_to_non_nullable
          : isLoading as bool,
      isPaginationLoading:
          isPaginationLoading == const $CopyWithPlaceholder() || isPaginationLoading == null
              ? _value.isPaginationLoading
              // ignore: cast_nullable_to_non_nullable
              : isPaginationLoading as bool,
      error: error == const $CopyWithPlaceholder()
          ? _value.error
          // ignore: cast_nullable_to_non_nullable
          : error as String?,
    );
  }
}

extension $HomeStateCopyWith on HomeState {
  /// Returns a callable class that can be used as follows: `instanceOfHomeState.copyWith(...)` or like so:`instanceOfHomeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HomeStateCWProxy get copyWith => _$HomeStateCWProxyImpl(this);
}
