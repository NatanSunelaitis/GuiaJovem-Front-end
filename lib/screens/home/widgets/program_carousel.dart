import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:guia_jovem/shared/widgets/program_card.dart';
import 'package:guia_jovem/models/program.dart';
import 'package:guia_jovem/shared/widgets/program_summary_modal.dart';

class ProgramCarousel extends StatelessWidget {
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
    return CarouselSlider(
      options: CarouselOptions(
        height: 400, // Ajuste conforme necessário
        enlargeCenterPage: false,
        enableInfiniteScroll: true,
        autoPlay: false,
        viewportFraction: 0.33, // Para mostrar 3 cards
      ),
      items: programs.map((program) {
        return Builder(
          builder: (BuildContext context) {
            return ProgramCard(
              program: program,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ProgramSummaryModal(program: program);
                  },
                );
              },
            );
          },
        );
      }).toList(),
    );
  }
}

