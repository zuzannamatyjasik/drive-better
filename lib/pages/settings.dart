import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
                  child: Text('Dodaj alarmowy numer telefonu',
                      style: Theme.of(context).textTheme.headline6),
                ),
                Expanded(
                    flex: 1,
                    child: IconButton(icon: Icon(Icons.add), onPressed: () {}))
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
                          print('oooo');
                          return showDialog<void>(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('O aplikacji'),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text('Drive Better to aplikacja mająca na celu niwelowanie liczby oszustw finansowych popełnianych przez taksówkarzy. Jej zadaniem jest zwiększenie komfortu oraz bezpieczeństwa pasażerów.',
                                        style: TextStyle(),)
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
                                        Text('tutaj tez jakis tekst')
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
