import 'package:flutter/material.dart';
import 'colors.dart';

class ShrineTheme {
  static ThemeData buildShrineTheme() {
    final ThemeData base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith( primary: kShrinePink100,onPrimary: kShrineBrown900,secondary: kShrineBrown900,error: kShrineErrorRed),
      textTheme: ShrineTheme.buildShrineTextTheme(base.textTheme),
      textSelectionTheme: const TextSelectionThemeData(selectionColor: kShrinePink100),
      inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder( borderSide: BorderSide(width: 2.0,color: kShrineBrown900)),
          floatingLabelStyle: TextStyle(color: kShrineBrown900),
      ),
    );
  }

  static TextTheme buildShrineTextTheme(TextTheme base) {
    return base
        .copyWith(
          headlineSmall: base.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
          titleLarge: base.titleLarge!.copyWith(fontSize: 18.0),
          bodySmall: base.bodySmall!.copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
          bodyLarge: base.bodyLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 16.0),
        ).apply(fontFamily: 'Rubik', displayColor: kShrineBrown900, bodyColor: kShrineBrown900);
  }
}
