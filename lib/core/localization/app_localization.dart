import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale? locale;
  static const String _path = 'assets/lang/';
  late Map<String, String> _localStrings; //*mappa che gestisce i messaggi json

  AppLocalizations({this.locale});

  //restituisce la classe AppLocalizations corrispondente a
  static AppLocalizations? of(BuildContext context) {
    //ritorna la classe AppLocalizations e le risorse corrispondenti al suo locale
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  //GETTER PER VEDERE CHE LOCALE SONO
  bool get isEnLocale => locale!.languageCode == 'en';

  //metodo per caricare i json
  Future loadJsonFiles() async {
    String enocedString =
        await rootBundle.loadString("$_path${locale!.languageCode}.json");
    Map<String, dynamic> jsonMap = jsonDecode(enocedString);
    _localStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  //metodo che ritorna la traduzione a partire da una key relativa alla mappa
  String translate(String key) {
    return _localStrings[key] ?? '';
  }

  //il delegato che gestisce le risorse e traduzioni
  static LocalizationsDelegate<AppLocalizations> delegate =
      const _AppLocalDelegate();
}

//ORA DEFINISCO MIO DELEGATE PER GESTIRE LE RISORSE RELATIVE AL LOCALE
class _AppLocalDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalDelegate();
  //qui dico che il delegato funziona solo per inglese e italiano
  @override
  bool isSupported(Locale locale) {
    return ['en', 'it'].contains(locale.languageCode);
  }

  //qui carico i messaggi che servono in funzione del Locale
  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appLocal = AppLocalizations(locale: locale);
    await appLocal.loadJsonFiles();
    return appLocal;
  }

  //*do we need to load language files eachTime rebuilds?in questo caso NO
  //*covariant serve per dire che l'override che sto facendo
  //*prendo come parametro una sottoclasse
  @override
  bool shouldReload(covariant LocalizationsDelegate<dynamic> old) {
    return false;
  }
}

extension TranslateString on String {
  String tr(BuildContext context) {
    return AppLocalizations.of(context)!.translate(this);
  }
}
