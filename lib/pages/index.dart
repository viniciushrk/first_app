import 'package:first_app/pages/Yugioh.dart';
import 'package:first_app/pages/formulario.dart';
import 'package:first_app/pages/surprise.dart';
import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _currentIndex = 0;

  List _pages = [
    Formularinho(),
    Surprise(),
    Yugioh(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        title: Image.asset("images/yugioh2.png", scale: 8),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){},
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (_index){
            setState(() {
              _currentIndex = _index;
            });
          },
          // ou shifting
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              //backgroundColor: Colors.red,
                label: "Graus",
                icon: Icon(Icons.ac_unit_outlined)
            ),
            BottomNavigationBarItem(
                label: "Gift",
                icon: Icon(Icons.whatshot)
            ),
            BottomNavigationBarItem(
                label: "Inscrições",
                icon: Icon(Icons.subscriptions)
            ),
            BottomNavigationBarItem(
                label: "Biblioteca",
                icon: Icon(Icons.folder)
            ),
          ]
      ),
    );
  }
}