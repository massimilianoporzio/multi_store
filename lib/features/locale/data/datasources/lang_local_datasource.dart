import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/string_constants.dart';

abstract class LangLocalDS {
  Future<bool> changeLang({required String langCode});
  Future<String> getSavedLang();
}

class LangLocalDSImpl implements LangLocalDS {
  final SharedPreferences sharedPreferences;

  LangLocalDSImpl({required this.sharedPreferences});
  @override
  Future<bool> changeLang({required String langCode}) async {
    return await sharedPreferences.setString(AppStrings.locale, langCode);
  }

  @override
  Future<String> getSavedLang() async {
    return sharedPreferences.containsKey(AppStrings.locale)
        ? sharedPreferences.getString(AppStrings.locale)! //*se c'è nelle keys..
        : AppStrings.englishCode;
  }
}
