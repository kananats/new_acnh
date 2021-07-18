import 'package:equatable/equatable.dart';
import 'package:new_acnh/constant/enum/hemisphere_enum.dart';
import 'package:new_acnh/constant/enum/language_enum.dart';
import 'package:new_acnh/model/availability.dart';

import 'package:new_acnh/model/fish.dart';
import 'package:new_acnh/model/name.dart';

class FishFilter extends Equatable {
  final HemisphereEnum hemisphere;

  final String query;

  final List<bool> showCaught;
  final List<bool> showDonated;

  final bool hideAllYear;
  final bool hideAllDay;
  final bool showOnlyNow;

  const FishFilter({
    required this.hemisphere,
    required this.query,
    required this.showCaught,
    required this.showDonated,
    required this.hideAllYear,
    required this.hideAllDay,
    required this.showOnlyNow,
  });

  bool apply(
    Fish fish, {
    required LanguageEnum language,
    required DateTime dateTime,
  }) {
    if (!fish.name.of(language).contains(query)) return false;

    if (!showCaught[0] && fish.isCaught) return false;
    if (!showCaught[1] && !fish.isCaught) return false;

    if (!showDonated[0] && fish.isDonated) return false;
    if (!showDonated[1] && !fish.isDonated) return false;

    if (hideAllYear && fish.availability.isAllYear) return false;
    if (hideAllDay && fish.availability.isAllDay) return false;

    if (showOnlyNow &&
        !fish.availability.isAvailable(
          dateTime,
          hemisphere: hemisphere,
        )) return false;

    return true;
  }

  FishFilter copyWith({
    HemisphereEnum? hemisphere,
    String? query,
    List<bool>? showCaught,
    List<bool>? showDonated,
    bool? hideAllYear,
    bool? hideAllDay,
    bool? showOnlyNow,
  }) {
    return FishFilter(
      hemisphere: hemisphere ?? this.hemisphere,
      query: query ?? this.query,
      showCaught: showCaught ?? this.showCaught,
      showDonated: showDonated ?? this.showDonated,
      hideAllYear: hideAllYear ?? this.hideAllYear,
      hideAllDay: hideAllDay ?? this.hideAllDay,
      showOnlyNow: showOnlyNow ?? this.showOnlyNow,
    );
  }

  @override
  List<Object?> get props => [
        hemisphere,
        query,
        showCaught,
        showDonated,
        hideAllYear,
        hideAllDay,
        showOnlyNow,
      ];
}
