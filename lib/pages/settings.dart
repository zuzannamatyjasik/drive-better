import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            style: TextStyle(
              letterSpacing: 2,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.orangeAccent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                    Row(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Text(
                                'Dodaj alarmowy numer telefonu',
                                style: TextStyle(
                                  letterSpacing: 2,
                                )),
                      ),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {}
                          )
                      )
                    ]
                ),
                SizedBox(height: 20),
                Row(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Text(
                            'Zmień na tryb nocny',
                            style: TextStyle(
                              letterSpacing: 2,
                            )),
                      ),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                              icon: Icon(Icons.brightness_2),
                              onPressed: () {}
                          )
                      )
                    ]
                ),
                SizedBox(height: 20),
                Row(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Text(
                            'O aplikacji',
                            style: TextStyle(
                              letterSpacing: 2,
                            )),
                      ),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                              icon: Icon(Icons.computer),
                              onPressed: () {}
                          )
                      )
                    ]
                ),
                SizedBox(height: 20),
                Row(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: Text(
                            'Kontakt z deweloperem',
                            style: TextStyle(
                              letterSpacing: 2,
                            )),
                      ),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                              icon: Icon(Icons.contact_mail),
                              onPressed: () {}
                          )
                      )
                    ]
                )
              ]
          )
        )
    );
  }
}