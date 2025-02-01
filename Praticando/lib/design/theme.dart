import 'package:flutter/material.dart';
import 'shape.dart';
import 'colors.dart';

class ShrineTheme {
  static ThemeData buildShrineTheme() {
    final ThemeData base = ThemeData.light(useMaterial3: true);
    final BeveledRectangleBorder beveledShape = const BeveledRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(7.0)),
    );

    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(primary: kShrinePurple, secondary: kShrinePurple, error: kShrineErrorRed),
      scaffoldBackgroundColor: kShrineSurfaceWhite,

      appBarTheme: const AppBarTheme(
        foregroundColor: kShrineBrown900,
        backgroundColor: kShrinePink100,
      ),

      inputDecorationTheme: const InputDecorationTheme(
          border: CutCornersBorder(),
          focusedBorder: CutCornersBorder(borderSide: BorderSide(width: 2.0, color: kShrineBrown900)),
          floatingLabelStyle: TextStyle(color: kShrineBrown900),
      ),

      textTheme: ShrineTheme.buildShrineTextTheme(base.textTheme),
      textSelectionTheme: const TextSelectionThemeData( selectionColor: kShrinePink100),
      textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(shape: beveledShape,)),
      elevatedButtonTheme: ElevatedButtonThemeData( style: ElevatedButton.styleFrom(shape: beveledShape)),
    );
  }

  static TextTheme buildShrineTextTheme(TextTheme base) {
    return base
        .copyWith(
          headlineSmall: base.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
          titleLarge: base.titleLarge!.copyWith(fontSize: 18.0),
          bodySmall: base.bodySmall!.copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
          bodyLarge: base.bodyLarge!.copyWith(fontWeight: FontWeight.w500, fontSize: 16.0),
        )
        .apply(fontFamily: 'Rubik', displayColor: kShrineBrown900, bodyColor: kShrineBrown900);
  }
}
