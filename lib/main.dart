import 'package:flutter/material.dart';
import 'package:drivebetter/pages/routeMap.dart';
import 'package:drivebetter/pages/settings.dart';
import 'package:drivebetter/pages/loading.dart';
import 'package:drivebetter/pages/home.dart';
import 'package:drivebetter/UI/theme.dart';
import 'package:theme_provider/theme_provider.dart';


void main() => {  
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      themes: [
        AppTheme(
          id: "light",
          data: basicTheme(),
          description: "light"),
        AppTheme(
          id: "dark",
          data: darkTheme(),
          description: "dark"
        )],
      child: ThemeConsumer(
        child: Builder(
          builder: (themeContext) => MaterialApp(
            theme: ThemeProvider.themeOf(themeContext).data,
            initialRoute: '/',
            routes: {
              '/': (context) => Loading(),
              '/home': (context) => Home(),
              '/routeMap': (context) => RouteMap(),
              '/settings': (context) => Settings(),
            },
          ),
        ),
      ),
    );
  }
}
