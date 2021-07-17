import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/constant/enum/language_enum.dart';
import 'package:flutter_template/logic/cubit/language_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.all(12),
        children: [_buildLanguageSetting()],
      ),
    );
  }

  Widget _buildLanguageSetting() {
    return Row(
      children: [
        const Expanded(
          child: Text("Language"),
        ),
        Expanded(
          flex: 2,
          child: BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              return DropdownButton<LanguageEnum>(
                isExpanded: true,
                value: state is ReadyLanguageState ? state.language : null,
                onChanged: (value) {
                  if (value != null)
                    context.read<LanguageCubit>().setLanguage(value);
                },
                items: LanguageEnum.values.map((language) {
                  return DropdownMenuItem<LanguageEnum>(
                    value: language,
                    child: Text(language.rawValue),
                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}
