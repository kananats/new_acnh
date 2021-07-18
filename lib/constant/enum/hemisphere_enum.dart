import 'package:flutter_template/constant/annotation/raw_representable.dart';
import 'package:flutter_template/constant/annotation/raw_value.dart';

part 'hemisphere_enum.g.dart';

@RawRepresentable()
enum HemisphereEnum {
  @RawValue("Northern")
  northern,

  @RawValue("Southern")
  southern,
}
