import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/constant/theme_constant.dart';
import 'package:flutter_template/data/database/database.dart';
import 'package:flutter_template/logic/cubit/fish_cubit.dart';
import 'package:flutter_template/logic/cubit/language_cubit.dart';
import 'package:flutter_template/logic/cubit/navigation_cubit.dart';
import 'package:flutter_template/logic/cubit/time_cubit.dart';
import 'package:flutter_template/presentation/page/fish_list_page.dart';
import 'package:flutter_template/presentation/page/settings_page.dart';
import 'package:flutter_template/util/locator.dart';

Future<void> main() async {
  // This will turn Object.toString() to readable format
  EquatableConfig.stringify = true;

  // Ensure WidgetsFlutterBinding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Setup local database
  await Database.initialize();

  // Setup dependency injection
  setupLocator();

  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late final _fishCubit = FishCubit();
  late final _languageCubit = LanguageCubit();
  late final _navigationCubit = NavigationCubit();
  late final _timeCubit = TimeCubit();

  @override
  void dispose() {
    _fishCubit.close();
    _languageCubit.close();
    _navigationCubit.close();
    _timeCubit.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>.value(value: _navigationCubit),
      ],
      child: MaterialApp(
        title: "My App",
        theme: ThemeConstant.theme,
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
            return Navigator(
              pages: state.pages.map((page) {
                return MaterialPage(
                  key: ValueKey(page),
                  child: _withBlocProviders(page),
                );
              }).toList(),
              onPopPage: context.read<NavigationCubit>().onPopPage,
            );
          },
        ),
      ),
    );
  }

  Widget _withBlocProviders(Widget child) {
    final List<BlocProvider> providers = [
      if (child is FishListPage)
        BlocProvider<FishCubit>.value(value: _fishCubit),
      if (child is FishListPage || child is SettingsPage)
        BlocProvider<LanguageCubit>.value(value: _languageCubit),
      if (child is FishListPage || child is SettingsPage)
        BlocProvider<TimeCubit>.value(value: _timeCubit),
    ];

    if (providers.isEmpty) return child;

    return MultiBlocProvider(
      providers: providers,
      child: child,
    );
  }
}
