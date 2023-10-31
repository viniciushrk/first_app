import 'package:flutter/material.dart';

class CustomSeachDelegate extends SearchDelegate<String>{

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.close),
          onPressed: (){
            query = "";
          }
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back),
        onPressed: (){
          close(context, "");
        }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

}