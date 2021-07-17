import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/data/storage/shared_prefs.dart';
import 'package:flutter_template/util/locator.dart';

part 'time_state.dart';

class TimeCubit extends Cubit<TimeState> {
  final sharedPrefs = locator.get<SharedPrefs>();

  late final Timer _timer;

  TimeCubit()
      : super(
          TimeState(
            DateTime.now(),
            freezed: false,
          ),
        ) {
    _initialize();
  }

  void setDate(DateTime value) {
    final dateTime = state.dateTime;
    final newDateTime = DateTime(
      value.year,
      value.month,
      value.day,
      dateTime.hour,
      dateTime.minute,
      dateTime.second,
      dateTime.millisecond,
      dateTime.microsecond,
    );
    emit(
      TimeState(newDateTime, freezed: state.freezed),
    );
  }

  void setTime(TimeOfDay value) {
    final dateTime = state.dateTime;
    final newDateTime = DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      value.hour,
      value.minute,
    );
    emit(
      TimeState(newDateTime, freezed: state.freezed),
    );
  }

  void toggleFreezed() {
    emit(
      TimeState(state.dateTime, freezed: !state.freezed),
    );
  }

  @override
  void emit(TimeState state) {
    super.emit(state);

    if (state.freezed) {
      sharedPrefs.setDateTimeOffset(null);
      sharedPrefs.setFreezedDateTime(state.dateTime);
    } else {
      sharedPrefs.setDateTimeOffset(DateTime.now().difference(state.dateTime));
      sharedPrefs.setFreezedDateTime(null);
    }
  }

  @override
  Future<void> close() async {
    _timer.cancel();

    await super.close();
  }

  Future<void> _initialize() async {
    final dateTimeOffset = await sharedPrefs.getDateTimeOffset();
    final freezedDateTime = await sharedPrefs.getFreezedDateTime();

    DateTime dateTime = DateTime.now();
    bool freezed = false;

    if (dateTimeOffset != null)
      dateTime = DateTime.now().subtract(dateTimeOffset);
    else if (freezedDateTime != null) {
      dateTime = freezedDateTime;
      freezed = true;
    }

    emit(
      TimeState(dateTime, freezed: freezed),
    );

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (!state.freezed)
          emit(
            TimeState(
              state.dateTime.add(const Duration(seconds: 1)),
              freezed: state.freezed,
            ),
          );
      },
    );
  }
}
