import 'package:flutter/material.dart';

class Surprise extends StatefulWidget {
  const Surprise({super.key});

  @override
  State<Surprise> createState() => _SurpriseState();
}

class _SurpriseState extends State<Surprise> {

  void _trollAlert() {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text("Caiu na trollagem 2000"),
      content: Text("O dinheiro não vem fácil, vai trabalhar"),
      actions: [
        TextButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.deepPurple),
            ),
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: Text(
              "Tururu",
              style: TextStyle(
                  color: Colors.white
              ),
            )
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image.asset(
                      "images/money.jpg",
                      width: 200,
                      height: 200,
                    ),
                    Text("Parabéns você ganhou 200 Dolares"),
                    ElevatedButton(
                      onPressed: _trollAlert,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        child: Text(
                          "Resgatar",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
        );
  }
}