import 'package:first_app/pages/formulario.dart';
import 'package:first_app/pages/index.dart';
import 'package:first_app/pages/surprise.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name) {
      case "/index":
        return MaterialPageRoute(
            builder: (_) => Index()
        );
      case "/form":
        return MaterialPageRoute(
            builder: (_) => Formularinho()
        );
      case "/surprise":
        return MaterialPageRoute(
            builder: (_) => Surprise()
        );
      default:
        return _erroRota();
    }
  }

  static Route<dynamic> _erroRota(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text("Tela não encontrada"),
        ),
        body: Center(
          child: Text("Tela não encontrada"),
        ),
      );
    });
  }

}