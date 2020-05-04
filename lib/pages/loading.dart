import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void loadingTime() {
    var future = Future.delayed(Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, '/home'));
  }

  @override
  void initState() {
    super.initState();
    loadingTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orangeAccent,
        body: Center(
          child: SpinKitCircle(
            color: Colors.black,
            size: 150.0,
            duration: Duration(seconds: 1),
          ),
        ));
  }
}
