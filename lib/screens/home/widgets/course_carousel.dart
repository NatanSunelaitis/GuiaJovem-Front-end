import 'package:flutter/material.dart';
import 'package:guia_jovem/shared/widgets/course_card.dart';

class CourseCarousel extends StatelessWidget {
  final List<Map<String, String>> courses = [
    {
      'imagePath': 'lib/assets/image/ads.png',
      'title': 'Análise e Desenvolvimento de Sistemas',
    },
    {
      'imagePath': 'lib/assets/image/psicologia.png',
      'title': 'Psicologia',
    },
    {
      'imagePath': 'lib/assets/image/direito.png',
      'title': 'Direito',
    },
    {
      'imagePath': 'lib/assets/image/enfermagem.png',
      'title': 'Enfermagem',
    },
    {
      'imagePath': 'lib/assets/image/administracao.png',
      'title': 'Administração',
    },
    {
      'imagePath': 'lib/assets/image/biomedicina.png',
      'title': 'Biomedicina',
    },
    {
      'imagePath': 'lib/assets/image/med_veterinaria.png',
      'title': 'Medicina Veterinária',
    },
    {
      'imagePath': 'lib/assets/image/nutricao.png',
      'title': 'Nutrição',
    },
    {
      'imagePath': 'lib/assets/image/pedagogia.png',
      'title': 'Pedagogia',
    },
    {
      'imagePath': 'lib/assets/image/gestao_rh.png',
      'title': 'Gestão de Recursos Humanos',
    },
    {
      'imagePath': 'lib/assets/image/farmacia.png',
      'title': 'Farmácia',
    },
    {
      'imagePath': 'lib/assets/image/ciencias_contabeis.png',
      'title': 'Ciências Contábeis',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Cursos Disponíveis',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4,
            childAspectRatio: 1.5,
            mainAxisSpacing: 16.0,
            crossAxisSpacing: 16.0,
            children: courses.map((course) {
              return CourseCard(
                imagePath: course['imagePath']!,
                title: course['title']!,
                onTap: () {
                  // Implementar ação ao clicar no card do curso
                },
              );
            }).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {
                // Implementar navegação para a página de todos os cursos
              },
              child: Text('Ver mais cursos'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


