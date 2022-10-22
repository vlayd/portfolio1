import 'package:flutter/material.dart';
import 'package:portefolio/src/util/constantes.dart';

class Tema {

  ThemeData themeData() {
    return ThemeData(
      primaryColor: Colors.white
    );
  }

  static ThemeData themeData2(BuildContext context) {
    return ThemeData(
      primaryColor: Colors.red,
      elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: const Color(C.themeColorTextBtn),
                onPrimary: const Color(C.themeColorBtn),
                side: const BorderSide(color: Colors.red),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(C.themeRadium),
                  ),
                ),
                textStyle: const TextStyle(
                    fontSize: 18
                )
            )
        ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(C.themeRadium)
        ),
        labelStyle: const TextStyle(
          fontSize: 18
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }

  static ThemeData themeData3() {
    return ThemeData(
        primaryColor: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                primary: const Color(C.dark),
                shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(10)
                    )
                ),
                textStyle: const TextStyle(
                    fontSize: 20
                )
            )
        )
    );
  }
}
