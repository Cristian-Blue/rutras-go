import 'package:flutter/material.dart';

const Color _customColor = Color(0xff49149f);

const List<Color> _colorThemes = [
  Color.fromARGB(255, 74, 86, 255),
  Colors.blue,
  Colors.red,
  Colors.yellow,
  Colors.lightGreen,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
    : assert(
        selectedColor >= 0 && selectedColor <= _colorThemes.length,
        'Color > 0  and < ${_colorThemes.length}',
      );

  Color get colorTheme => _colorThemes[selectedColor];

  ThemeData themeData(int modeDark) {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      appBarTheme: AppBarTheme(
        backgroundColor: _colorThemes[selectedColor],
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        centerTitle: false,
      ),
      brightness: modeDark == 1 ? Brightness.dark : Brightness.light,
    );
  }
}
