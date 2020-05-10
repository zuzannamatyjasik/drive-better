import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData basicTheme(){
  TextTheme _basicTextTheme(TextTheme base){
      return base.copyWith(
        headline6: base.headline6.copyWith( //title & labels & settings
            letterSpacing: 2,
            color: Colors.black,
            fontSize: 16
        ),
          headline5: base.headline5.copyWith( //title & labels & settings
              letterSpacing: 2,
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500
          ),
        button: base.button.copyWith( //button
            letterSpacing: 2,
            fontSize: 20,
            color: Colors.black
        ),
        caption: base.caption.copyWith( //description
        letterSpacing: 2,
        fontSize: 18,
        fontWeight: FontWeight.bold
        )
      );
  }
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: _basicTextTheme(base.textTheme),
    primaryColor: Colors.orangeAccent,
    accentColor: Colors.black,
    disabledColor: Colors.grey,
    highlightColor: Colors.red,
    hintColor: Colors.white,
      iconTheme: IconThemeData(
          color: Colors.black
      )
  );
}

ThemeData darkTheme(){
  TextTheme _basicTextTheme(TextTheme base){
    return base.copyWith(
        headline6: base.headline6.copyWith( //title & labels & settings
            letterSpacing: 2,
            color: Colors.orange[200],
            fontSize: 16
        ),
        headline5: base.headline5.copyWith( //title & labels & settings
            letterSpacing: 2,
            color: Colors.orange[200],
            fontSize: 20,
            fontWeight: FontWeight.w500
        ),
        button: base.button.copyWith( //button
            letterSpacing: 2,
            fontSize: 20,
            color: Colors.orange[200]
        ),
        caption: base.caption.copyWith( //description
            letterSpacing: 2,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.orange[200]
        )
    );
  }
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
      textTheme: _basicTextTheme(base.textTheme),
      primaryColor: Colors.grey[800],
      accentColor: Colors.orange[200],
      disabledColor: Colors.grey[600],
      highlightColor: Colors.red,
      hintColor: Colors.grey[800],
      iconTheme: IconThemeData(
        color: Colors.orange[200]
      )
  );
}

