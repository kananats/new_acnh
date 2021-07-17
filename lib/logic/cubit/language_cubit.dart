import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_template/constant/enum/language_enum.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(InitialLanguageState()) {
    emit(
      const ReadyLanguageState(LanguageEnum.USen),
    );
  }

  void setLanguage(LanguageEnum languageEnum) {
    emit(
      ReadyLanguageState(languageEnum),
    );
  }
}
