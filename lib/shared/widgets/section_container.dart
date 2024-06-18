import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  final String title;
  final Widget child;
  final String buttonText;
  final VoidCallback buttonAction;

  SectionContainer({
    required this.title,
    required this.child,
    required this.buttonText,
    required this.buttonAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 245, 245, 245), // Ajuste conforme necessário
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Centraliza os textos
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left, // Centraliza o texto
                ),
              ),
              TextButton(
                onPressed: buttonAction,
                child: Text(
                  buttonText,
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.right, // Alinha à direita
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: 400, // Ajuste a altura conforme necessário
            child: child,
          ),
        ],
      ),
    );
  }
}






