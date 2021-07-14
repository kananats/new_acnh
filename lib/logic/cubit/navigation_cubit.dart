import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/page/home_page.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit({
    List<Widget> pages = const [
      HomePage(),
    ],
  }) : super(NavigationState(pages));

  Future<void> pop(dynamic result) async {
    final newState = state.pop(result);

    emit(newState);
  }

  Future<void> popUntilRoot() async {
    final newState = state.popUntilRoot();

    emit(newState);
  }

  bool onPopPage(Route<dynamic> route, dynamic result) {
    final newState = state.onPopPage(route, result);

    if (state == newState) return false;

    emit(newState);
    return true;
  }
}
