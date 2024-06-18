import 'package:flutter/material.dart';
import 'package:guia_jovem/models/campus.dart';
import 'package:guia_jovem/screens/university/widgets/campus_summary_modal.dart';

class UniversitySummaryModal extends StatefulWidget {
  final String imagePath;
  final String name;
  final String description;
  final String website;
  final List<Campus> campuses;

  const UniversitySummaryModal({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.website,
    required this.campuses,
  }) : super(key: key);

  @override
  _UniversitySummaryModalState createState() => _UniversitySummaryModalState();
}

class _UniversitySummaryModalState extends State<UniversitySummaryModal> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredCampuses = widget.campuses
        .where((campus) =>
            campus.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        constraints: BoxConstraints(maxWidth: 600),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                widget.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  // Implement navigation to the university website
                },
                icon: Icon(Icons.link),
                label: Text('Acessar Página da Faculdade'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Campus',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Pesquisar campus',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: filteredCampuses.length > 4 ? 200 : null,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: filteredCampuses.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                title: Text(filteredCampuses[index].name),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return CampusSummaryModal(
                                              campusName:
                                                  filteredCampuses[index].name,
                                            );
                                          },
                                        );
                                      },
                                      child: Text('ver campus'),
                                    ),
                                    Icon(Icons.arrow_forward),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Como entrar na ${widget.name}?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Para entrar na ${widget.name}, é necessário se inscrever e prestar o vestibular e os cursos que deseja entrar.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

