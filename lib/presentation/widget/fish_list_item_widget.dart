import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/logic/cubit/fish_cubit.dart';
import 'package:flutter_template/logic/cubit/language_cubit.dart';
import 'package:flutter_template/logic/cubit/time_cubit.dart';
import 'package:flutter_template/model/availability.dart';
import 'package:flutter_template/model/fish.dart';
import 'package:flutter_template/model/name.dart';
import 'package:flutter_template/presentation/widget/tag_widget.dart';

class FishListItemWidget extends StatelessWidget {
  final Fish fish;

  const FishListItemWidget(
    this.fish, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Image.network(
        fish.iconUri,
        width: 56,
      ),
      title: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return Text(
            state is ReadyLanguageState ? fish.name.of(state.language) : "",
          );
        },
      ),
      subtitle: BlocBuilder<TimeCubit, TimeState>(
        buildWhen: (previous, current) {
          return previous.dateTime.month != current.dateTime.month ||
              previous.dateTime.hour != current.dateTime.hour;
        },
        builder: (context, state) {
          return Wrap(
            spacing: 8,
            children: [
              if (fish.isCaught) const TagWidget("Caught"),
              if (fish.isDonated) const TagWidget("Donated"),
              if (fish.availability.isAllYear) const TagWidget("All Year"),
              if (fish.availability.isAllDay) const TagWidget("All Day"),
              if (fish.availability.isAvailable(
                state.dateTime,
                isNorth: true,
              ))
                const TagWidget("Now"),
            ],
          );
        },
      ),
      children: [
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            _buildIsCaughtChip(context),
            _buildIsDonatedChip(context),
          ],
        ),
      ],
    );
  }

  Widget _buildIsCaughtChip(BuildContext context) {
    return FilterChip(
      selected: fish.isCaught,
      onSelected: (_) {
        context.read<FishCubit>().toggleIsCaught(fish);
      },
      backgroundColor: Colors.pink,
      selectedColor: Colors.pink,
      checkmarkColor: Colors.white,
      elevation: 0,
      pressElevation: 0,
      label: const Text(
        "Caught",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildIsDonatedChip(BuildContext context) {
    return FilterChip(
      selected: fish.isDonated,
      onSelected: (_) {
        context.read<FishCubit>().toggleIsDonated(fish);
      },
      backgroundColor: Colors.pink,
      selectedColor: Colors.pink,
      checkmarkColor: Colors.white,
      elevation: 0,
      pressElevation: 0,
      label: const Text(
        "Donated",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
