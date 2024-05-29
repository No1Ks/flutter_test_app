// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$LocaleStateCWProxy {
  LocaleState currentLocale(Locale currentLocale);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LocaleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LocaleState(...).copyWith(id: 12, name: "My name")
  /// ````
  LocaleState call({
    Locale? currentLocale,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfLocaleState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfLocaleState.copyWith.fieldName(...)`
class _$LocaleStateCWProxyImpl implements _$LocaleStateCWProxy {
  const _$LocaleStateCWProxyImpl(this._value);

  final LocaleState _value;

  @override
  LocaleState currentLocale(Locale currentLocale) => this(currentLocale: currentLocale);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `LocaleState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// LocaleState(...).copyWith(id: 12, name: "My name")
  /// ````
  LocaleState call({
    Object? currentLocale = const $CopyWithPlaceholder(),
  }) {
    return LocaleState(
      currentLocale: currentLocale == const $CopyWithPlaceholder() || currentLocale == null
          ? _value.currentLocale
          // ignore: cast_nullable_to_non_nullable
          : currentLocale as Locale,
    );
  }
}

extension $LocaleStateCopyWith on LocaleState {
  /// Returns a callable class that can be used as follows: `instanceOfLocaleState.copyWith(...)` or like so:`instanceOfLocaleState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$LocaleStateCWProxy get copyWith => _$LocaleStateCWProxyImpl(this);
}
