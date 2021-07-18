import 'package:new_acnh/constant/annotation/raw_representable.dart';

part 'shared_prefs_key_enum.g.dart';

@RawRepresentable()
enum SharedPrefsKeyEnum {
  language,
  dateTimeOffset,
  freezedDateTime,
}
