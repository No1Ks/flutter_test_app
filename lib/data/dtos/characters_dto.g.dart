// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersDto _$CharactersDtoFromJson(Map<String, dynamic> json) => CharactersDto(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CharacterDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null ? null : MetaDto.fromJson(json['meta'] as Map<String, dynamic>),
    );

CharacterDataDto _$CharacterDataDtoFromJson(Map<String, dynamic> json) => CharacterDataDto(
      id: json['id'] as String?,
      type: json['type'] as String?,
      attributes: json['attributes'] == null
          ? null
          : CharacterAttributesDataDto.fromJson(json['attributes'] as Map<String, dynamic>),
    );

CharacterAttributesDataDto _$CharacterAttributesDataDtoFromJson(Map<String, dynamic> json) =>
    CharacterAttributesDataDto(
      name: json['name'] as String?,
      born: json['born'] as String?,
      died: json['died'] as String?,
      image: json['image'] as String?,
    );

MetaDto _$MetaDtoFromJson(Map<String, dynamic> json) => MetaDto(
      pagination: json['pagination'] == null
          ? null
          : PaginationDto.fromJson(json['pagination'] as Map<String, dynamic>),
    );

PaginationDto _$PaginationDtoFromJson(Map<String, dynamic> json) => PaginationDto(
      current: json['current'] as int?,
      next: json['next'] as int?,
      last: json['last'] as int?,
    );
