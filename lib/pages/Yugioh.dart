import 'dart:ffi';

import 'package:first_app/Dtos/CardGame.dart';
import 'package:first_app/data/ApiYugioh.dart';
import 'package:flutter/material.dart';

class Yugioh extends StatefulWidget {
  const Yugioh({super.key});

  @override
  State<Yugioh> createState() => _YugiohState();
}

class _YugiohState extends State<Yugioh> {
  _listarCards() async {
    final api = await ApiYugioh().pesquisar('');
    return api;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: _listarCards(),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none :
            case ConnectionState.waiting :
              return const Center(child: CircularProgressIndicator(),);
            case ConnectionState.active :
            case ConnectionState.done :
              if(snapshot.hasData){
                return ListView.separated(
                    itemBuilder: (context, index){
                      List<CardGame?> cards = snapshot.data!;
                      CardGame? card = cards[index];
                      //print(video?.image);
                      dynamic imageStk = card?.image_url_cropped;

                      return GestureDetector(
                        onTap: (){
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => YoutPlay(video.id))
                          // );
                        },
                        child: Column(children: [
                          Container(child:
                          Image(image: NetworkImage(imageStk))
                          ),
                          ListTile(
                            title: Text(card!.name),
                            subtitle: Text(card.name),
                          )
                        ],),
                      );
                    },
                    separatorBuilder: (context, index)=>const Divider(
                      height: 20,
                      color: Colors.grey,
                    ),
                    itemCount: snapshot.data!.length
                );
              }else{
                return const Center(child: Text("Nenhum dado a exibir"));
              }
          }
        }
    );
  }
}
