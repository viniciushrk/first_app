import 'package:first_app/Dtos/CardGame.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const baseUrl = "https://db.ygoprodeck.com/api/v7/cardinfo.php?language=pt&num=5&offset=0";
// const baseUrl = "https://db.ygoprodeck.com/api/v7/cardinfo.php?name=Dark Magician&num=2&offset=0";

class ApiYugioh {

  Future<List<CardGame?>?> pesquisar(String pesquisa) async {
    var url = Uri.parse(baseUrl);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> retornoJson = json.decode(response.body);

      if (retornoJson.containsKey("data")) {
        List<CardGame?> cards = [];
        var t = (retornoJson["data"] as List);

        for(int i = 1; i < t.length; i++ ) {
          cards.add(CardGame.fromJson(t[i]));
        }

        return cards;
      }
    }
  }

}
