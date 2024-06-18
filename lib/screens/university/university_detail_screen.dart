import 'package:flutter/material.dart';

class UniversityDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mocked data
    final university = {
      'name': 'Universidade de São Paulo',
      'description': 'A melhor universidade da América Latina.',
      'courses': ['Engenharia', 'Medicina', 'Direito']
    };

    final universityName = university['name'] as String? ?? 'Unknown';
    final universityDescription = university['description'] as String? ?? 'No description available';
    final universityCourses = university['courses'] as List<String>? ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(universityName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              universityName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(universityDescription),
            SizedBox(height: 20),
            Text(
              'Cursos Oferecidos',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: universityCourses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(universityCourses[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


