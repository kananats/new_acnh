import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/constant/enum/hemisphere_enum.dart';
import 'package:flutter_template/data/api/repository/fish_repository.dart';
import 'package:flutter_template/model/fish.dart';
import 'package:flutter_template/model/fish_filter.dart';
import 'package:flutter_template/util/locator.dart';

part 'fish_state.dart';

class FishCubit extends Cubit<FishState> {
  final fishRepository = locator.get<FishRepository>();

  FishCubit() : super(InitialFishState());

  Future<void> fetch() async {
    final state = this.state;

    if (state is LoadingFishState) return;

    emit(LoadingFishState());

    final fishes = await fishRepository.findFishes();
    if (fishes.isEmpty) {
      await fishRepository.fetchFishes();

      fishes.addAll(
        await fishRepository.findFishes(),
      );
    }

    emit(
      ReadyFishState(
        fishes,
        filter: (state is ReadyFishState)
            ? state.filter.copyWith()
            : const FishFilter(
                hemisphere: HemisphereEnum.northern,
                query: "",
                showCaught: [true, true],
                showDonated: [true, true],
                hideAllYear: false,
                hideAllDay: false,
                showOnlyNow: false,
              ),
      ),
    );
  }

  Future<void> toggleIsCaught(Fish fish) async {
    final newFish = fish.copyWith(isCaught: !fish.isCaught);

    await fishRepository.updateFish(newFish);

    await fetch();
  }

  Future<void> toggleIsDonated(Fish fish) async {
    final newFish = fish.copyWith(isDonated: !fish.isDonated);

    await fishRepository.updateFish(newFish);

    await fetch();
  }

  Future<void> applyFilter(FishFilter filter) async {
    final state = this.state;

    if (state is! ReadyFishState) return;

    emit(
      ReadyFishState(
        state.fishes,
        filter: filter,
      ),
    );
  }
}
