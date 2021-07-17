part of 'time_cubit.dart';

class TimeState extends Equatable {
  final DateTime dateTime;
  final bool freezed;

  const TimeState(
    this.dateTime, {
    required this.freezed,
  });

  @override
  List<Object?> get props => [dateTime, freezed];
}
