import 'package:flutter/material.dart';
import 'package:guia_jovem/shared/widgets/navbar.dart';

class AlunoHistoricoSugestoesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: Center(
        child: Text('Histórico de Sugestões'),
      ),
    );
  }
}
