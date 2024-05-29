import 'app_locale.dart';

/// The translations for Russian (`ru`).
class AppLocaleRu extends AppLocale {
  AppLocaleRu([String locale = 'ru']) : super(locale);

  @override
  String get search => 'Поиск';

  @override
  String get liked => 'понравился!';

  @override
  String get disliked => 'разонравился :(';

  @override
  String get arbEnding => 'Чтобы не забыть про отсутствие запятой :)';
}
