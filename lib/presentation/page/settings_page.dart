import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/constant/enum/language_enum.dart';
import 'package:flutter_template/logic/cubit/language_cubit.dart';
import 'package:flutter_template/logic/cubit/time_cubit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
        children: [
          _buildLanguageSetting(),
          _buildDateSetting(),
          _buildTimeSetting(),
          _buildFreezedSetting(),
        ],
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

  Widget _buildDateSetting() {
    return Row(
      children: [
        const Expanded(
          child: Text("Date"),
        ),
        Expanded(
          flex: 2,
          child: BlocBuilder<TimeCubit, TimeState>(
            builder: (context, state) {
              return TextButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    useRootNavigator: false,
                    initialDate: state.dateTime,
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 365)),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );

                  if (date != null) context.read<TimeCubit>().setDate(date);
                },
                child: Text(
                  DateFormat.yMMMMd().format(state.dateTime),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTimeSetting() {
    return Row(
      children: [
        const Expanded(
          child: Text("Time"),
        ),
        Expanded(
          flex: 2,
          child: BlocBuilder<TimeCubit, TimeState>(
            builder: (context, state) {
              return TextButton(
                onPressed: () async {
                  final time = await showTimePicker(
                    context: context,
                    useRootNavigator: false,
                    initialTime: TimeOfDay.fromDateTime(state.dateTime),
                  );

                  if (time != null) context.read<TimeCubit>().setTime(time);
                },
                child: Text(
                  DateFormat.Hms().format(state.dateTime),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFreezedSetting() {
    return Row(
      children: [
        const Expanded(
          child: Text("Freezed"),
        ),
        Expanded(
          flex: 2,
          child: BlocBuilder<TimeCubit, TimeState>(
            builder: (context, state) {
              return Checkbox(
                value: state.freezed,
                onChanged: (_) {
                  context.read<TimeCubit>().toggleFreezed();
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
