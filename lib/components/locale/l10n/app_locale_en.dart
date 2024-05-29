import 'app_locale.dart';

/// The translations for English (`en`).
class AppLocaleEn extends AppLocale {
  AppLocaleEn([String locale = 'en']) : super(locale);

  @override
  String get search => 'Search';

  @override
  String get liked => 'liked!';

  @override
  String get disliked => 'disliked :(';

  @override
  String get arbEnding => 'Чтобы не забыть про отсутствие запятой :)';
}
