import 'package:flutter_test_app/data/dtos/characters_dto.dart';
import 'package:flutter_test_app/domain/models/card.dart';

extension CharacterDataDtoToModel on CharacterDataDto {
  CardData toDomain() => CardData(
        attributes?.name ?? 'UNKNOWN',
        imageUrl: attributes?.image,
        descriptionText: '${attributes?.born} - ${attributes?.died}',
      );
}
