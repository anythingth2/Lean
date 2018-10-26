import 'package:flutter/material.dart';
import 'package:lean/Style.dart';
import 'dart:async';
import 'package:lean/Util.dart';

class SpashScreenPage extends StatefulWidget {
  @override
  _SpashScreenPageState createState() => _SpashScreenPageState();
}

class _SpashScreenPageState extends State<SpashScreenPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startSplash();
  }

  startSplash() async {
    return Timer(Duration(seconds: 2), () {
      Util.router.goHome(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: meThemeDecoration,
          child: Column(
            children: <Widget>[
              Image.asset(
                'Assets/recycle.png',
                width: 248.0,
                height: 248.0,
              ),
              // MeTextLogo(Strings.appName)
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
