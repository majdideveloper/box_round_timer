import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(_getSystemLocale()) {
    _loadLanguage();
  }

  // Get the system's default locale
  static Locale _getSystemLocale() {
    final systemLocale = PlatformDispatcher.instance.locale;
    return Locale(systemLocale.languageCode);
  }

  // Load language preference or fallback to system locale
  void _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('language');

    if (languageCode != null) {
      emit(Locale(languageCode));
    }
  }

  // Change language and save preference
  void changeLanguage(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', locale.languageCode);
    emit(locale);
  }
}
