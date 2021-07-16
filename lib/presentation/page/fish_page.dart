import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/logic/cubit/fish_cubit.dart';
import 'package:flutter_template/model/fish.dart';
import 'package:provider/provider.dart';

class FishPage extends StatefulWidget {
  const FishPage({
    Key? key,
  }) : super(key: key);

  @override
  _FishPageState createState() => _FishPageState();
}

class _FishPageState extends State<FishPage> {
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
        return _buildFishListTile(fishes[index]);
      },
    );
  }

  Widget _buildFishListTile(Fish fish) {
    return ExpansionTile(
      leading: Image.network(fish.iconUri),
      title: Text(fish.fileName),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
