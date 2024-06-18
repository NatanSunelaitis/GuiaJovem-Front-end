import 'package:flutter/material.dart';

class AllCollegesScreen extends StatelessWidget {
  final List<Map<String, String>> colleges;

  AllCollegesScreen({required this.colleges});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todas as Faculdades'),
      ),
      body: ListView.builder(
        itemCount: colleges.length,
        itemBuilder: (context, index) {
          final college = colleges[index];
          return ListTile(
            leading: Image.network(college['logoUrl']!),
            title: Text(college['name']!),
            subtitle: Text('${college['recommendation']}% dos alunos recomendam esta instituição'),
            trailing: Text('A partir de ${college['price']}'),
          );
        },
      ),
    );
  }
}
