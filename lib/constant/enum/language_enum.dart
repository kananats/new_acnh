// ignore_for_file: constant_identifier_names

import 'package:new_acnh/constant/annotation/raw_representable.dart';
import 'package:new_acnh/constant/annotation/raw_value.dart';

part 'language_enum.g.dart';

@RawRepresentable()
enum LanguageEnum {
  @RawValue("English (US)")
  USen,

  @RawValue("English (Europe)")
  EUen,

  @RawValue("Deutsch")
  EUde,

  @RawValue("Español (Europe)")
  EUes,

  @RawValue("Español (Latinoamérica)")
  USes,

  @RawValue("Français (Europe)")
  EUfr,

  @RawValue("Français (Canada)")
  USfr,

  @RawValue("Italiano")
  EUit,

  @RawValue("Nederlands")
  EUnl,

  @RawValue("简体中文")
  CNzh,

  @RawValue("繁體中文")
  TWzh,

  @RawValue("日本語")
  JPja,

  @RawValue("한국어")
  KRko,

  @RawValue("Русский")
  EUru,
}
