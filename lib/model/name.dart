// ignore_for_file: non_constant_identifier_names

import 'package:new_acnh/constant/enum/language_enum.dart';
import 'package:new_acnh/data/database/entity/name_entity.dart';

class Name {
  final String USen;

  final String EUen;

  final String EUde;

  final String EUes;

  final String USes;

  final String EUfr;

  final String USfr;

  final String EUit;

  final String EUnl;

  final String CNzh;

  final String TWzh;

  final String JPja;

  final String KRko;

  final String EUru;

  const Name({
    required this.USen,
    required this.EUen,
    required this.EUde,
    required this.EUes,
    required this.USes,
    required this.EUfr,
    required this.USfr,
    required this.EUit,
    required this.EUnl,
    required this.CNzh,
    required this.TWzh,
    required this.JPja,
    required this.KRko,
    required this.EUru,
  });

  factory Name.fromEntity(NameEntity entity) {
    return Name(
      USen: entity.USen,
      EUen: entity.EUen,
      EUde: entity.EUde,
      EUes: entity.EUes,
      USes: entity.USes,
      EUfr: entity.EUfr,
      USfr: entity.USfr,
      EUit: entity.EUit,
      EUnl: entity.EUnl,
      CNzh: entity.CNzh,
      TWzh: entity.TWzh,
      JPja: entity.JPja,
      KRko: entity.KRko,
      EUru: entity.EUru,
    );
  }
}

extension NameExtension on Name {
  String of(LanguageEnum language) {
    switch (language) {
      case LanguageEnum.USen:
        return USen;
      case LanguageEnum.EUen:
        return EUen;
      case LanguageEnum.EUde:
        return EUde;
      case LanguageEnum.EUes:
        return EUes;
      case LanguageEnum.USes:
        return USes;
      case LanguageEnum.EUfr:
        return EUfr;
      case LanguageEnum.USfr:
        return USfr;
      case LanguageEnum.EUit:
        return EUit;
      case LanguageEnum.EUnl:
        return EUnl;
      case LanguageEnum.CNzh:
        return CNzh;
      case LanguageEnum.TWzh:
        return TWzh;
      case LanguageEnum.JPja:
        return JPja;
      case LanguageEnum.KRko:
        return KRko;
      case LanguageEnum.EUru:
        return EUru;
    }
  }
}
