import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/logic/cubit/fish_cubit.dart';
import 'package:flutter_template/logic/cubit/time_cubit.dart';
import 'package:flutter_template/model/fish.dart';
import 'package:flutter_template/model/fish_filter.dart';
import 'package:flutter_template/presentation/widget/app_drawer.dart';
import 'package:flutter_template/presentation/widget/fish_filter_dialog.dart';
import 'package:flutter_template/presentation/widget/fish_list_item_widget.dart';
import 'package:provider/provider.dart';

class FishListPage extends StatefulWidget {
  const FishListPage({
    Key? key,
  }) : super(key: key);

  @override
  _FishListPageState createState() => _FishListPageState();
}

class _FishListPageState extends State<FishListPage> {
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
                    return _buildFishList(
                      fishState.fishes
                          .where(
                            (fish) => fishState.filter.apply(
                              fish,
                              dateTime: timeState.dateTime,
                            ),
                          )
                          .toList(),
                    );
                  },
                )
              : _buildLoadingIndicator(),
        );
      },
    );
  }

  Widget _buildFishList(List<Fish> fishes) {
    return ListView.builder(
      itemCount: fishes.length,
      itemBuilder: (context, index) {
        return FishListItemWidget(fishes[index]);
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
