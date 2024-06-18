import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:guia_jovem/shared/widgets/college_card.dart';
import 'package:guia_jovem/models/college.dart';
import 'package:guia_jovem/screens/home/widgets/college_summary_modal.dart';

class CollegeCarousel extends StatelessWidget {
  final List<College> colleges = [
    College(
      imagePath: 'lib/assets/image/cruzeiro.png',
      name: 'Cruzeiro do Sul Virtual',
      recommendation: '87% dos alunos recomendam esta instituição',
      price: '',
      description: 'Uma das maiores instituições de ensino superior do Brasil.',
      additionalInfo: 'Campus em São Paulo, Cursos reconhecidos pelo MEC',
      rating: 4.6,
      reviews: 371,
    ),
    College(
      imagePath: 'lib/assets/image/unicsul.png',
      name: 'UNIC SUL',
      recommendation: '86% dos alunos recomendam esta instituição',
      price: '',
      description: 'Mais de 50 anos de tradição.',
      additionalInfo: 'Campus em várias cidades, Cursos reconhecidos pelo MEC',
      rating: 4.4,
      reviews: 250,
    ),
    College(
      imagePath: 'lib/assets/image/unisa.png',
      name: 'UNISA',
      recommendation: '83% dos alunos recomendam esta instituição',
      price: '',
      description: 'Uma das maiores instituições de ensino superior do Brasil.',
      additionalInfo: 'Campus em São Paulo, Cursos reconhecidos pelo MEC',
      rating: 4.5,
      reviews: 320,
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
      items: colleges.map((college) {
        return Builder(
          builder: (BuildContext context) {
            return CollegeCard(
              imagePath: college.imagePath,
              name: college.name,
              recommendation: college.recommendation,
              price: college.price,
              description: college.description,
              additionalInfo: college.additionalInfo,
              rating: college.rating,
              reviews: college.reviews,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CollegeSummaryModal(college: college);
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




