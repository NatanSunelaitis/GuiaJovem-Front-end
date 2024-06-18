import 'package:flutter/material.dart';

class UniversityInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Informações da Universidade: Nome, CNPJ, razão social, status, telefone, endereço.',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
