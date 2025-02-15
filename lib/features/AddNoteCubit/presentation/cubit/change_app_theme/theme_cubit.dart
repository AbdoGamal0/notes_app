import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(_lightTheme);

  static final ThemeData _lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
  );

  static final ThemeData _darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
  );

  bool get isDark => state.brightness == Brightness.dark;

  void toggleTheme() {
    emit(isDark ? _lightTheme : _darkTheme);
  }
}
