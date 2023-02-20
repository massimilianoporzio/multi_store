import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:multi_store/core/utils/string_constants.dart';

import '../../../../core/presentation/usecases/base_usecase.dart';
import '../../domain/usecases/change_locale.dart';
import '../../domain/usecases/get_saved_lang.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetSavedLangUseCase getSavedLangUseCase;
  final ChangeLocaleUseCase changeLangUseCase;
  String currentLangCode = AppStrings.englishCode; //codice del lang iniziale

  LocaleCubit({
    required this.getSavedLangUseCase,
    required this.changeLangUseCase,
  }) : super(LocaleState.initial());

  Future<void> getSavedLang() async {
    final response = await getSavedLangUseCase(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheFailure), (langCode) {
      currentLangCode = langCode;
      emit(state.copyWith(locale: Locale(currentLangCode)));
    });
  }

  Future<void> _changeLang(String langCode) async {
    final response = await changeLangUseCase(langCode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailure),
        (isChanged) {
      currentLangCode = isChanged ? langCode : AppStrings.englishCode;
      emit(state.copyWith(locale: Locale(currentLangCode)));
    });
  }

  void toEnglish() => _changeLang(AppStrings.englishCode);
  void toItalian() => _changeLang(AppStrings.italianCode);
}
