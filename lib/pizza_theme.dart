
import 'package:flutter/material.dart';

ThemeData myPizzaTheme ()=> ThemeData(
    fontFamily: 'Cairo',
    splashColor: Colors.greenAccent,

    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      primarySwatch: Colors.yellow,
    ).copyWith(
      secondary: Colors.orange,
    ),

    switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(Colors.deepPurple),
        trackColor: MaterialStateProperty.all(Colors.purpleAccent)),

    textTheme: const TextTheme(
      headline6: TextStyle(fontSize: 24.0, color: Colors.brown),
      subtitle1: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic, color: Colors.indigo),
      bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.red),
    )
);