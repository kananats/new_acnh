import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/logic/cubit/fish_cubit.dart';
import 'package:flutter_template/model/fish.dart';
import 'package:flutter_template/presentation/widget/app_drawer.dart';
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
      builder: (context, state) {
        return Scaffold(
          drawer: AppDrawer(),
          appBar: AppBar(
            title: Text(
              state is ReadyFishState
                  ? "Fish (${state.fishes.length})"
                  : "Fish",
            ),
          ),
          body: state is ReadyFishState
              ? _buildFishList(state.fishes)
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
}
