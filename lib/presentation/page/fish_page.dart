import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:new_acnh/constant/enum/language_enum.dart';
import 'package:new_acnh/logic/cubit/fish_cubit.dart';
import 'package:new_acnh/logic/cubit/language_cubit.dart';
import 'package:new_acnh/model/fish.dart';
import 'package:new_acnh/model/name.dart';
import 'package:new_acnh/presentation/widget/available_month_widget.dart';
import 'package:new_acnh/presentation/widget/available_time_widget.dart';
import 'package:new_acnh/util/extension/string_extension.dart';

class FishPage extends StatelessWidget {
  final Fish fish;

  const FishPage(
    this.fish, {
    Key? key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            final language = state is ReadyLanguageState
                ? state.language
                : LanguageEnum.USen;

            return Text(
              fish.name.of(language).capitalize(),
            );
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          SizedBox(
            height: 150,
            child: Row(
              children: [
                Expanded(child: _buildIcon()),
                Expanded(child: _buildImage()),
              ],
            ),
          ),
          _buildAvailableMonthNorth(),
          const SizedBox(height: 24),
          _buildAvailableMonthSouth(),
          const SizedBox(height: 24),
          _buildAvailableTime(),
          const SizedBox(height: 24),
          _buildPrice(),
          _buildLocation(),
          _buildShadow(),
          _buildRarity(),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              _buildIsCaughtChip(context),
              _buildIsDonatedChip(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Hero(
      tag: fish.iconUri,
      child: Image.network(
        fish.iconUri,
      ),
    );
  }

  Widget _buildImage() {
    return Image.network(fish.imageUri);
  }

  Widget _buildAvailableMonthNorth() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Available Month (North)",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 6),
        AvailableMonthWidget(fish.availability.monthArrayNorthern),
      ],
    );
  }

  Widget _buildAvailableMonthSouth() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Available Month (South)",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 6),
        AvailableMonthWidget(fish.availability.monthArraySouthern),
      ],
    );
  }

  Widget _buildAvailableTime() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Available Time",
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 6),
        AvailableTimeWidget(fish.availability.timeArray),
      ],
    );
  }

  Widget _buildPrice() {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(child: Icon(Icons.attach_money)),
      title: const Text("Price"),
      trailing: Text("${fish.price} bells"),
    );
  }

  Widget _buildLocation() {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(child: Icon(Icons.location_pin)),
      title: const Text("Location"),
      trailing: Text(fish.availability.location),
    );
  }

  Widget _buildShadow() {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(child: Icon(Icons.visibility)),
      title: const Text("Shadow"),
      trailing: Text(fish.shadow),
    );
  }

  Widget _buildRarity() {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(child: Icon(Icons.grade)),
      title: const Text("Rarity"),
      trailing: Text(fish.availability.rarity),
    );
  }

  Widget _buildIsCaughtChip(BuildContext context) {
    return BlocBuilder<FishCubit, FishState>(
      builder: (context, state) {
        if (state is! ReadyFishState) return Container();

        final fish = state.fishes.firstWhere((fish) => fish.id == this.fish.id);

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
      },
    );
  }

  Widget _buildIsDonatedChip(BuildContext context) {
    return BlocBuilder<FishCubit, FishState>(
      builder: (context, state) {
        if (state is! ReadyFishState) return Container();

        final fish = state.fishes.firstWhere((fish) => fish.id == this.fish.id);

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
      },
    );
  }
}
