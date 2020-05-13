import 'package:device_info/device_info.dart';
import 'package:drivebetter/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String id;
  String numerTelefonu;

  void getAndroidId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    id = androidInfo.androidId;
    numerTelefonu = await DatabaseServices(id: id).getData();
  }

  void zaktualizujNumer(String nowyNumerTelefonu) async {
    await DatabaseServices(id: id).updateUserData(nowyNumerTelefonu);
  }

  @override
  void initState() {
    super.initState();
    getAndroidId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Ustawienia',
              style: Theme.of(context).textTheme.headline5,
            ),
            backgroundColor: Theme.of(context).primaryColor,
            iconTheme: IconThemeData(color: Theme.of(context).accentColor)),
        body: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(children: <Widget>[
              SizedBox(height: 20),
              Row(children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text('Alarmowy numer telefonu',
                      style: Theme.of(context).textTheme.headline6),
                ),
                Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          return showDialog<void>(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Edytuj numer telefonu'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text('Aktualny numer $numerTelefonu'),
                                        SizedBox(height: 20),
                                        TextField(
                                          onChanged: (String str) {
                                            setState(() {
                                              numerTelefonu = str;
                                            });
                                          },
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            hintText: '3333',
                                            border: OutlineInputBorder(),
                                            labelText: 'Numer telefonu: ',
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Powrót',
                                          style: Theme.of(context)
                                              .textTheme
                                              .button),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    FlatButton(
                                        child: Text('Zapisz',
                                            style: Theme.of(context)
                                                .textTheme
                                                .button),
                                        onPressed: () {
                                          zaktualizujNumer(numerTelefonu);
                                          Navigator.of(context).pop();
                                        })
                                  ],
                                );
                              });
                        }))
              ]),
              SizedBox(height: 20),
              Row(children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text('Zmień motyw',
                      style: Theme.of(context).textTheme.headline6),
                ),
                Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: Icon(Icons.brightness_2),
                        onPressed: () {
                          ThemeProvider.controllerOf(context).nextTheme();
                        }))
              ]),
              SizedBox(height: 20),
              Row(children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text('O aplikacji',
                      style: Theme.of(context).textTheme.headline6),
                ),
                Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: Icon(Icons.computer),
                        onPressed: () {
                          return showDialog<void>(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('O aplikacji'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text(
                                          'Drive Better to aplikacja mająca na celu niwelowanie liczby oszustw finansowych popełnianych przez taksówkarzy. Jej zadaniem jest zwiększenie komfortu oraz bezpieczeństwa pasażerów.',
                                          style: TextStyle(),
                                        )
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Powrót',
                                          style: Theme.of(context)
                                              .textTheme
                                              .button),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        }))
              ]),
              SizedBox(height: 20),
              Row(children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Text(
                    'Kontakt z deweloperem',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: Icon(Icons.contact_mail),
                        onPressed: () {
                          return showDialog<void>(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Kontakt z deweloperem'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text(
                                            'Wszelkie uwagi można kierować na adres help@drivebetter.com')
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Powrót',
                                          style: Theme.of(context)
                                              .textTheme
                                              .button),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        }))
              ])
            ])));
  }
}
