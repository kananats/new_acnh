part of 'language_cubit.dart';

abstract class LanguageState extends Equatable {
  const LanguageState();

  @override
  List<Object?> get props => [];
}

class InitialLanguageState extends LanguageState {}

class ReadyLanguageState extends LanguageState {
  final LanguageEnum language;

  const ReadyLanguageState(
    this.language,
  );

  @override
  List<Object?> get props => [language];
}
