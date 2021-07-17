import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/logic/cubit/language_cubit.dart';
import 'package:flutter_template/model/fish.dart';
import 'package:flutter_template/model/name.dart';

class FishListItemWidget extends StatelessWidget {
  final Fish fish;

  const FishListItemWidget(
    this.fish, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Image.network(fish.iconUri),
      title: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return Text(
            state is ReadyLanguageState ? fish.name.of(state.language) : "",
          );
        },
      ),
    );
  }
}
