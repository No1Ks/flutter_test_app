import 'package:flutter_test_app/data/dtos/characters_dto.dart';
import 'package:flutter_test_app/domain/models/card.dart';
import 'package:flutter_test_app/domain/models/home.dart';

const _imagePlaceholder =
    'https://upload.wikimedia.org/wikipedia/en/archive/b/b1/20210811082420%21Portrait_placeholder.png';

extension CharactersDtoToModel on CharactersDto {
  HomeData toDomain() => HomeData(
        data: data?.map((e) => e.toDomain()).toList(),
        nextPage: meta?.pagination?.next,
      );
}

extension CharacterDataDtoToModel on CharacterDataDto {
  CardData toDomain() => CardData(
        attributes?.name ?? 'UNKNOWN',
        imageUrl: attributes?.image ?? _imagePlaceholder,
        descriptionText: _makeDescriptionText(attributes?.born, attributes?.died),
        id: id,
      );

  String _makeDescriptionText(String? born, String? died) {
    return born != null && died != null
        ? '$born - $died'
        : born != null
            ? 'born: $born'
            : died != null
                ? 'died: $died'
                : '';
  }
}
