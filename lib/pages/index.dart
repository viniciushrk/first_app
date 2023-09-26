import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Menu"),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image.asset(
                      "images/deadpoll.jpg",
                      width: 200,
                      height: 200,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child:
                            ElevatedButton(
                              onPressed: (){
                                Navigator.pushNamed(context, "/form");
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                                child: Text(
                                  "Converter temperatura",
                                  style: TextStyle(fontSize: 14, color: Colors.white),
                                ),
                              ),
                            )
                        ),
                        Expanded(
                            child:
                            ElevatedButton(
                              onPressed: (){
                                Navigator.pushNamed(context, "/surprise");
                              },
                              style: ElevatedButton.styleFrom(primary: Colors.orange),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 28),
                                child: Text(
                                  "Surprise",
                                  style: TextStyle(fontSize: 14, color: Colors.white),
                                ),
                              ),
                            )
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
        )
    );
  }
}