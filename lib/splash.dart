import 'dart:async';

import 'package:flutter/material.dart';
import 'package:keybox/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(seconds: 5), () => Navigator.of(context).pushNamed('/login'));
  }

  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage(
        'assets/splash.png'); //<- Creates an object that fetches an image.
    var image = new Image(
        image: assetsImage,
        height: 300); //<- Creates a widget that displays an image.

    return Scaffold(
      backgroundColor: blue,
      body: Center(
        child: image,
      ),
    );
  }
}
