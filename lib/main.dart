import 'package:first_app/pages/index.dart';
import 'package:first_app/route/RouteGenerator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/index",
    onGenerateRoute: RouteGenerator.generateRoute,
    home: Index(),
  ));
}
