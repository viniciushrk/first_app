import 'package:first_app/Dtos/CardGame.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const baseUrl = "https://db.ygoprodeck.com/api/v7/cardinfo.php";
// const baseUrl = "https://db.ygoprodeck.com/api/v7/cardinfo.php?name=Dark Magician&num=2&offset=0";

class ApiYugioh {

  Future<List<CardGame?>?> pesquisar([String? pesquisa = null]) async {
    var url =  Uri.parse(baseUrl +
        "?language=pt"
        "&num=8"
        "&offset=0"
    );

    if(pesquisa != null){
      url = Uri.parse(baseUrl +
          "?name=$pesquisa"
          "&num=6&offset=0"
      );
    }

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> retornoJson = json.decode(response.body);

      if (retornoJson.containsKey("data")) {
        List<CardGame?> cards = [];
        var t = (retornoJson["data"] as List);

        for(int i = 0; i < t.length; i++ ) {
          cards.add(CardGame.fromJson(t[i]));
        }

        return cards;
      }
    }
  }

}
