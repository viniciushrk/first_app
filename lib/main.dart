import 'package:first_app/pages/Yugioh.dart';
import 'package:first_app/pages/index.dart';
import 'package:first_app/route/RouteGenerator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "AppCardGame",
    // onGenerateRoute: RouteGenerator.generateRoute,
    debugShowCheckedModeBanner: false,
    home: Index(),
  ));
}
