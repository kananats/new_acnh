import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:new_acnh/model/fish.dart';
import 'package:new_acnh/presentation/page/fish_list_page.dart';
import 'package:new_acnh/presentation/page/fish_page.dart';
import 'package:new_acnh/presentation/page/settings_page.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit({
    List<Widget> pages = const [
      FishListPage(
        key: ValueKey("FishListPage"),
      ),
    ],
  }) : super(NavigationState(pages));

  Future<void> navigateToSettings() async {
    final newState = state.push(
      const SettingsPage(
        key: ValueKey("SettingsPage"),
      ),
    );

    emit(newState);
  }

  Future<void> navigateToFish(Fish fish) async {
    final newState = state.push(
      FishPage(
        fish,
        key: const ValueKey("FishPage"),
      ),
    );

    emit(newState);
  }

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
