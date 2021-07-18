import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_acnh/constant/enum/language_enum.dart';
import 'package:new_acnh/logic/cubit/fish_cubit.dart';
import 'package:new_acnh/logic/cubit/language_cubit.dart';
import 'package:new_acnh/logic/cubit/navigation_cubit.dart';
import 'package:new_acnh/logic/cubit/time_cubit.dart';
import 'package:new_acnh/model/fish.dart';
import 'package:new_acnh/model/fish_filter.dart';
import 'package:new_acnh/presentation/widget/app_drawer.dart';
import 'package:new_acnh/presentation/widget/fish_filter_dialog.dart';
import 'package:new_acnh/presentation/widget/fish_list_item_widget.dart';
import 'package:new_acnh/util/debounce.dart';
import 'package:provider/provider.dart';

class FishListPage extends StatefulWidget {
  const FishListPage({
    Key? key,
  }) : super(key: key);

  @override
  _FishListPageState createState() => _FishListPageState();
}

class _FishListPageState extends State<FishListPage> {
  final _debounce = Debounce();

  @override
  void initState() {
    super.initState();

    context.read<FishCubit>().fetch();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FishCubit, FishState>(
      builder: (context, fishState) {
        return Scaffold(
          drawer: AppDrawer(),
          appBar: AppBar(
            title: Text(
              fishState is ReadyFishState
                  ? "Fish (${fishState.fishes.length})"
                  : "Fish",
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async => await _showFilterDialog(),
            child: const Icon(Icons.tune),
          ),
          body: fishState is ReadyFishState
              ? BlocBuilder<TimeCubit, TimeState>(
                  buildWhen: (previous, current) {
                    return previous.dateTime.month != current.dateTime.month ||
                        previous.dateTime.hour != current.dateTime.hour;
                  },
                  builder: (context, timeState) {
                    return Column(
                      children: [
                        _buildQueryTextField(
                          context,
                          filter: fishState.filter,
                        ),
                        Expanded(
                          child: BlocBuilder<LanguageCubit, LanguageState>(
                            builder: (context, languageState) {
                              return _buildFishList(
                                fishState.fishes
                                    .where(
                                      (fish) => fishState.filter.apply(
                                        fish,
                                        language:
                                            languageState is ReadyLanguageState
                                                ? languageState.language
                                                : LanguageEnum.USen,
                                        dateTime: timeState.dateTime,
                                      ),
                                    )
                                    .toList(),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                )
              : _buildLoadingIndicator(),
        );
      },
    );
  }

  Widget _buildQueryTextField(
    BuildContext context, {
    required FishFilter filter,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          icon: Icon(Icons.search),
        ),
        onChanged: (value) {
          _debounce(() {
            final newFilter = filter.copyWith(query: value);

            context.read<FishCubit>().applyFilter(newFilter);
          });
        },
      ),
    );
  }

  Widget _buildFishList(List<Fish> fishes) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: fishes.length,
      itemBuilder: (context, index) {
        final fish = fishes[index];
        return GestureDetector(
          onLongPress: () {
            context.read<NavigationCubit>().navigateToFish(fish);
          },
          child: FishListItemWidget(
            fish,
            key: ValueKey(fish.id),
          ),
        );
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Future<void> _showFilterDialog() async {
    final fishCubit = context.read<FishCubit>();
    final state = fishCubit.state;

    if (state is! ReadyFishState) return;

    final filter = await showDialog<FishFilter>(
      context: context,
      useRootNavigator: false,
      builder: (_) => FishFilterDialog(state.filter),
    );

    if (filter != null) fishCubit.applyFilter(filter);
  }
}
