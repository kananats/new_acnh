import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/constant/theme_constant.dart';
import 'package:flutter_template/logic/cubit/navigation_cubit.dart';
import 'package:flutter_template/util/locator.dart';

Future<void> main() async {
  // This will turn Object.toString() to readable format
  EquatableConfig.stringify = true;

  // Ensure WidgetsFlutterBinding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Setup dependency injection
  setupLocator();

  // Uncomment this if we need local db
  // await Boxes.initialize();

  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late final _navigationCubit = NavigationCubit();

  @override
  void dispose() {
    _navigationCubit.close();

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
    final List<BlocProvider> providers = [];

    if (providers.isEmpty) return child;

    return MultiBlocProvider(
      providers: providers,
      child: child,
    );
  }
}
