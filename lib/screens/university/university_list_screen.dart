import 'package:flutter/material.dart';
import 'package:guia_jovem/shared/widgets/university_card.dart';
import 'package:guia_jovem/screens/university/widgets/university_summary_modal.dart';
import 'package:guia_jovem/models/campus.dart';

class UniversityListScreen extends StatefulWidget {
  @override
  _UniversityListScreenState createState() => _UniversityListScreenState();
}

class _UniversityListScreenState extends State<UniversityListScreen> {
  final List<University> universities = [
    University(
      imagePath: 'lib/assets/image/fatec.png',
      name: 'Faculdade de Tecnologia do Estado de São Paulo (FATEC)',
      description: 'As faculdades de Tecnologia do Estado de São Paulo são instituições públicas de ensino superior pertencentes ao Centro Estadual de Educação Tecnológica Paula Souza.',
      website: 'https://www.cps.sp.gov.br/fatec/',
      campuses: [
        Campus(name: 'Fatec Sorocaba'),
        Campus(name: 'Fatec São Paulo'),
        Campus(name: 'Fatec Indaiatuba'),
        Campus(name: 'Fatec Catanduva'),
        Campus(name: 'Fatec Jundiaí'),
        Campus(name: 'Fatec Ourinhos'),
        Campus(name: 'Fatec Tatuí'),
      ],
    ),
    University(
      imagePath: 'lib/assets/image/usp.png',
      name: 'USP',
      description: 'Universidade de São Paulo.',
      website: 'https://www.usp.br/',
      campuses: [
        Campus(name: 'USP São Paulo'),
        Campus(name: 'USP Ribeirão Preto'),
        Campus(name: 'USP São Carlos'),
      ],
    ),
    University(
      imagePath: 'lib/assets/image/unesp.png',
      name: 'UNESP',
      description: 'Universidade Estadual Paulista.',
      website: 'https://www.unesp.br/',
      campuses: [
        Campus(name: 'UNESP São Paulo'),
        Campus(name: 'UNESP Botucatu'),
        Campus(name: 'UNESP São José do Rio Preto'),
      ],
    ),
    University(
      imagePath: 'lib/assets/image/univesp.png',
      name: 'UNIVESP',
      description: 'Universidade Virtual do Estado de São Paulo.',
      website: 'https://univesp.br/',
      campuses: [
        Campus(name: 'UNIVESP São Paulo'),
        Campus(name: 'UNIVESP Campinas'),
        Campus(name: 'UNIVESP Sorocaba'),
      ],
    ),
  ];

  String _selectedType = 'publicas';
  double _distance = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                          'Escolha sua faculdade e a cidade para buscar as melhores vagas',
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
                                  labelText: 'Qual universidade deseja ver?',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Qual cidade gostaria de filtrar?',
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
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Radio<String>(
                                          value: 'publicas',
                                          groupValue: _selectedType,
                                          onChanged: (String? value) {
                                            setState(() {
                                              _selectedType = value!;
                                            });
                                          },
                                        ),
                                        Text('Públicas / Federais'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio<String>(
                                          value: 'privadas',
                                          groupValue: _selectedType,
                                          onChanged: (String? value) {
                                            setState(() {
                                              _selectedType = value!;
                                            });
                                          },
                                        ),
                                        Text('Privadas'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Raio:'),
                                  Slider(
                                    value: _distance,
                                    min: 0,
                                    max: 100,
                                    divisions: 20,
                                    label: 'até ${_distance.round()}km',
                                    onChanged: (double value) {
                                      setState(() {
                                        _distance = value;
                                      });
                                    },
                                  ),
                                ],
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
                      itemCount: universities.length,
                      itemBuilder: (BuildContext context, int index) {
                        return UniversityCard(
                          imagePath: universities[index].imagePath,
                          name: universities[index].name,
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return UniversitySummaryModal(
                                  imagePath: universities[index].imagePath,
                                  name: universities[index].name,
                                  description: universities[index].description,
                                  website: universities[index].website,
                                  campuses: universities[index].campuses,
                                );
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
      ),
    );
  }
}

class University {
  final String imagePath;
  final String name;
  final String description;
  final String website;
  final List<Campus> campuses;

  University({
    required this.imagePath,
    required this.name,
    required this.description,
    required this.website,
    required this.campuses,
  });
}
