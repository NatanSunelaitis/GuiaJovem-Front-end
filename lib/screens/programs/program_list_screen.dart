import 'package:flutter/material.dart';
import 'package:guia_jovem/shared/widgets/program_card.dart';
import 'package:guia_jovem/shared/widgets/program_summary_modal.dart';
import 'package:guia_jovem/models/program.dart';

class ProgramListScreen extends StatefulWidget {
  @override
  _ProgramListScreenState createState() => _ProgramListScreenState();
}

class _ProgramListScreenState extends State<ProgramListScreen> {
  final List<Program> programs = [
    Program(
      imagePath: 'lib/assets/image/enem.png',
      title: 'ENEM',
      description: 'Exame Nacional do Ensino Médio.',
      additionalInfo: 'Porta de entrada para diversas universidades.',
    ),
    Program(
      imagePath: 'lib/assets/image/fies.png',
      title: 'FIES',
      description: 'Fundo de Financiamento Estudantil.',
      additionalInfo: 'Financiamento estudantil com condições especiais.',
    ),
    Program(
      imagePath: 'lib/assets/image/prouni.png',
      title: 'PROUNI',
      description: 'Programa Universidade para Todos.',
      additionalInfo: 'Bolsas de estudo em instituições privadas.',
    ),
    Program(
      imagePath: 'lib/assets/image/sisu.png',
      title: 'SISU',
      description: 'Sistema de Seleção Unificada.',
      additionalInfo: 'Vagas em instituições públicas de ensino superior.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 1200),
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Escolha o Programa de Entrada que deseja ver',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Qual programa deseja ver?',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton.icon(
                            onPressed: () {
                              // Implementar lógica de busca
                            },
                            icon: Icon(Icons.search),
                            label: Text('Pesquisar'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              onPrimary: Colors.white,
                              minimumSize: Size(120, 48),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount;
                  if (constraints.maxWidth > 1200) {
                    crossAxisCount = 3;
                  } else if (constraints.maxWidth > 800) {
                    crossAxisCount = 3;
                  } else {
                    crossAxisCount = 2;
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: programs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProgramCard(
                        program: programs[index],
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return ProgramSummaryModal(program: programs[index]);
                            },
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
