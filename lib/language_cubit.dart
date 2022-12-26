import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en'));
  var box = Hive.box("appSettings");
  void changeStartLang() async {
    String? langCode = box.get('lang') ?? 'ru';
    print(langCode);
    if (langCode != null) {
      emit(Locale(langCode, ''));
    }
  }

  String getLang() {
    String langCode = box.get('lang');
    return langCode;
  }

  void changeLang(context, String data) async {
    emit(Locale(data, ''));

    await box.put('lang', data);
  }
}
