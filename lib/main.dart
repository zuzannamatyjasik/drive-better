import 'package:flutter/material.dart';
import 'package:drivebetter/pages/routeMap.dart';
import 'package:drivebetter/pages/settings.dart';
import 'package:drivebetter/pages/loading.dart';
import 'package:drivebetter/pages/home.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/routeMap': (context) => RouteMap(),
    '/settings': (context) => Settings(),
    },
));
