import 'package:flutter/material.dart';

const primaryColor = Color.fromARGB(255, 96, 195, 255);
const secondaryColor = Color.fromARGB(255, 88, 135, 249);

BoxDecoration meThemeDecoration = BoxDecoration(
  gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 1.0],
      colors: [secondaryColor, primaryColor]),
);
