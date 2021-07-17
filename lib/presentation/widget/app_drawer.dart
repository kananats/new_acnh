import 'package:flutter/material.dart';
import 'package:flutter_template/logic/cubit/navigation_cubit.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).pop();

              context.read<NavigationCubit>().navigateToSettings();
            },
            title: const Text("Settings"),
          )
        ],
      ),
    );
  }
}
