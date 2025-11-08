import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _seed = Color(0xFF3E63F4);

ThemeData _base(Brightness b) {
  final scheme = ColorScheme.fromSeed(seedColor: _seed, brightness: b);
  final baseText = b == Brightness.light
      ? ThemeData.light().textTheme
      : ThemeData.dark().textTheme;

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    textTheme: GoogleFonts.interTextTheme(baseText),
    appBarTheme: AppBarTheme(
      backgroundColor: scheme.surface,
      foregroundColor: scheme.onSurface,
      elevation: 0,
      centerTitle: true,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: scheme.primaryContainer,
      foregroundColor: scheme.onPrimaryContainer,
      shape: const StadiumBorder(),
    ),
    cardTheme: const CardThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      elevation: 0,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      filled: true,
      isDense: true,
    ),
    chipTheme: ChipThemeData(
      labelStyle: GoogleFonts.interTextTheme(baseText).labelMedium,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      shape: const StadiumBorder(),
      side: BorderSide.none,
    ),
  );
}

final lightTheme = _base(Brightness.light);
final darkTheme = _base(Brightness.dark);
