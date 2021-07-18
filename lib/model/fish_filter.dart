import 'package:equatable/equatable.dart';
import 'package:flutter_template/model/fish.dart';

class FishFilter extends Equatable {
  final List<bool> showCaught;
  final List<bool> showDonated;

  const FishFilter({
    required this.showCaught,
    required this.showDonated,
  });

  bool apply(Fish fish) {
    if (!showCaught[0] && fish.isCaught) return false;
    if (!showCaught[1] && !fish.isCaught) return false;

    if (!showDonated[0] && fish.isDonated) return false;
    if (!showDonated[1] && !fish.isDonated) return false;

    return true;
  }

  FishFilter copyWith({
    List<bool>? showCaught,
    List<bool>? showDonated,
  }) {
    return FishFilter(
      showCaught: showCaught ?? this.showCaught,
      showDonated: showDonated ?? this.showDonated,
    );
  }

  @override
  List<Object?> get props => [showCaught, showDonated];
}
