import 'package:flutter/material.dart';

class UniversityFinancingProgramScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Programas de Financiamento'),
      ),
      body: Center(
        child: Text(
          'Gerenciar aceitação de programas de financiamento.',
          style: TextStyle(fontSize: 24),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implementar a lógica para adicionar um novo programa de financiamento
        },
        child: Icon(Icons.add),
        tooltip: 'Adicionar Programa de Financiamento',
      ),
    );
  }
}
