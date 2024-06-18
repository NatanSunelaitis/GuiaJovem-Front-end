import 'package:flutter/material.dart';

class AllProgramsScreen extends StatelessWidget {
  final List<Map<String, String>> programs;

  AllProgramsScreen({required this.programs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos os Programas'),
      ),
      body: ListView.builder(
        itemCount: programs.length,
        itemBuilder: (context, index) {
          final program = programs[index];
          return ListTile(
            leading: Image.network(program['logoUrl']!),
            title: Text(program['name']!),
            subtitle: Text(program['description']!),
          );
        },
      ),
    );
  }
}
