part of 'fish_cubit.dart';

abstract class FishState extends Equatable {
  const FishState();

  @override
  List<Object?> get props => [];
}

class InitialFishState extends FishState {}

class LoadingFishState extends FishState {}

class ReadyFishState extends FishState {
  final List<Fish> fishes;
  final FishFilter filter;

  const ReadyFishState(
    this.fishes, {
    required this.filter,
  });

  @override
  List<Object?> get props => [fishes, filter];
}
