import 'package:device_info/device_info.dart';
import 'package:drivebetter/services/database.dart';

Future<String> getAndroidId () async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  String id = androidInfo.androidId;
  String numerTelefonu = await DatabaseServices(id: id).getData();
  return numerTelefonu;
}