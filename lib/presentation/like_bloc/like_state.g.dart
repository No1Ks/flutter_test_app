// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LikeStateCWProxy {
  LikeState likedIds(List<String>? likedIds);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LikeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LikeState(...).copyWith(id: 12, name: "My name")
  /// ````
  LikeState call({
    List<String>? likedIds,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLikeState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLikeState.copyWith.fieldName(...)`
class _$LikeStateCWProxyImpl implements _$LikeStateCWProxy {
  const _$LikeStateCWProxyImpl(this._value);

  final LikeState _value;

  @override
  LikeState likedIds(List<String>? likedIds) => this(likedIds: likedIds);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LikeState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LikeState(...).copyWith(id: 12, name: "My name")
  /// ````
  LikeState call({
    Object? likedIds = const $CopyWithPlaceholder(),
  }) {
    return LikeState(
      likedIds: likedIds == const $CopyWithPlaceholder()
          ? _value.likedIds
          // ignore: cast_nullable_to_non_nullable
          : likedIds as List<String>?,
    );
  }
}

extension $LikeStateCopyWith on LikeState {
  /// Returns a callable class that can be used as follows: `instanceOfLikeState.copyWith(...)` or like so:`instanceOfLikeState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LikeStateCWProxy get copyWith => _$LikeStateCWProxyImpl(this);
}
