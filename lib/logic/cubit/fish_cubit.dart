import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/data/api/repository/fish_repository.dart';
import 'package:flutter_template/model/fish.dart';
import 'package:flutter_template/util/locator.dart';

part 'fish_state.dart';

class FishCubit extends Cubit<FishState> {
  final fishRepository = locator.get<FishRepository>();

  FishCubit() : super(InitialFishState());

  Future<void> fetch() async {
    if (state is LoadingFishState) return;

    emit(LoadingFishState());

    final fishes = await fishRepository.findFishes();
    if (fishes.isEmpty) {
      await fishRepository.fetchFishes();

      fishes.addAll(
        await fishRepository.findFishes(),
      );
    }

    emit(ReadyFishState(fishes: fishes));
  }
}
