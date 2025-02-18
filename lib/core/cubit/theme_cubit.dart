import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system) {
    _loadTheme();
  }

  // Load theme preference or fallback to system theme
  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool('isDarkMode');
    // If no preference is saved, system theme will be used by default
    if (isDarkMode == null) {
      emit(ThemeMode.system);
    } else {
      emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    }
  }

  // Toggle theme and save preference
  void toggleTheme() async {
    final isDark = state == ThemeMode.dark;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', !isDark);
    emit(isDark ? ThemeMode.light : ThemeMode.dark);
  }
}
