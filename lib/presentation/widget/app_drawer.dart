import 'package:flutter/material.dart';
import 'package:flutter_template/logic/cubit/navigation_cubit.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            _buildSettingsTile(context),
            const Spacer(),
            const Divider(),
            _buildAboutTile(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).pop();

        context.read<NavigationCubit>().navigateToSettings();
      },
      title: const Text("Settings"),
    );
  }

  Widget _buildAboutTile(BuildContext context) {
    return ListTile(
      onTap: () {
        showAboutDialog(
          context: context,
          applicationIcon: const Icon(Icons.flutter_dash),
          applicationName: "New ACNH",
          applicationVersion: "0.0.1",
          applicationLegalese: """
Using ACNHAPI (https://acnhapi.com/) as data provider

ACNHAPI is a fan made API/Website and claims no ownership of any intellectual property associated with Nintendo or Animal Crossing. All assets found on the site and the repository are the sole property of Nintendo and are only used for non-commercial and educational purpose.

This is for educational purpose. There is no copyright infringement intended.
© Kananat Suwanviwatana
          """,
        );
      },
      title: const Text("About"),
    );
  }
}
