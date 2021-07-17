import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/constant/enum/language_enum.dart';
import 'package:flutter_template/data/storage/shared_prefs.dart';
import 'package:flutter_template/util/locator.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  final sharedPrefs = locator.get<SharedPrefs>();

  LanguageCubit() : super(InitialLanguageState()) {
    _initialize();
  }

  Future<void> _initialize() async {
    final language = await sharedPrefs.getLanguage();

    if (language == null) {
      await setLanguage(LanguageEnum.USen);
      return;
    }

    emit(
      ReadyLanguageState(language),
    );
  }

  Future<void> setLanguage(LanguageEnum value) async {
    await sharedPrefs.setLanguage(value);

    emit(
      ReadyLanguageState(value),
    );
  }
}
