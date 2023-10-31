import 'package:flutter/material.dart';

class DetailCard extends StatefulWidget {
  String name = "";
  String desc = "";
  String archetype = "";
  String image_url = "";

  DetailCard(
    String name,
    String desc,
    String archetype,
    String image_url
  ){
    this.name = name;
    this.desc = desc;
    this.archetype = archetype;
    this.image_url = image_url;
  }

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detalhe" + widget.name),
        ),
        body: Container(
          color: Colors.white, // Cor de fundo do Container
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // Adicione seus widgets dentro do Column aqui
                  Image(image:NetworkImage(widget.image_url)),
                  Text(widget.name, style: TextStyle(fontSize: 12)),
                  Text('Detalhe:' + widget.desc, style: TextStyle(fontSize: 12)),
                  Text('Tipo:' + widget.archetype, style: TextStyle(fontSize: 12)),
                  // E assim por diante...
                ],
              ),
            ),
          ),
        )
    );
  }
}
