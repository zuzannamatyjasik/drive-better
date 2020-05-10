import 'dart:convert';
import 'package:drivebetter/keys.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';

var dystans;

Future<List<LatLng>> loadJson(
    double latPocz,
    double longPocz,
    double latKon,
    double longKon,
    ) async {


  String url = 'https://api.openrouteservice.org/v2/directions/driving-car?api_key=$apiKeyRoute&start=${longPocz.toString()},%20${latPocz.toString()}&end=${longKon.toString()},%20${latKon.toString()}';
  Response response = await get(url);
  var jsonResult = await json.decode(response.body);
  List<LatLng> polylineCoordinates = [];

  var dlugosc = jsonResult['features'][0]['geometry']['coordinates'].length;
  for (int i = 0; i <= dlugosc - 1; i++) {
    LatLng wspolrzedna = LatLng(
        jsonResult['features'][0]['geometry']['coordinates'][i][1],
        jsonResult['features'][0]['geometry']['coordinates'][i][0]);
    polylineCoordinates.add(wspolrzedna);

  }
  dystans = jsonResult['features'][0]['properties']['summary']['distance'];

  return polylineCoordinates;
}

