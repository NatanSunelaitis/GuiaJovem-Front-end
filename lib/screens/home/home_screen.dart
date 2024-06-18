import 'package:flutter/material.dart';
import 'package:guia_jovem/shared/widgets/section_container.dart';
import 'widgets/college_carousel.dart';
import 'widgets/program_carousel.dart';
import 'widgets/course_carousel.dart';
import 'package:guia_jovem/shared/widgets/login_dialog.dart';
import 'package:guia_jovem/shared/widgets/footer_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedType = 'publicas';
  double _distance = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Início'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('Programas de Entrada'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/programs');
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('Universidades'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/universities');
              },
            ),
            ListTile(
              leading: Icon(Icons.login),
              title: Text('Entrar'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return LoginDialog();
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'lib/assets/image/fundo.gif',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 300),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      constraints: BoxConstraints(maxWidth: 1200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Container(
                              padding: EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white.withOpacity(0.8),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Escolha uma cidade',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Curso que deseja estudar',
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Faculdade que deseja estudar',
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
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                constraints: BoxConstraints(maxWidth: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SectionContainer(
                      title: 'Faculdades',
                      child: CollegeCarousel(),
                      buttonText: 'Ver todas as faculdades',
                      buttonAction: () {
                        Navigator.pushNamed(context, '/universities');
                      },
                    ),
                    SizedBox(height: 20),
                    SectionContainer(
                      title: 'Programas de Entrada',
                      child: ProgramCarousel(),
                      buttonText: 'Ver todos os programas',
                      buttonAction: () {
                        Navigator.pushNamed(context, '/programs');
                      },
                    ),
                    SizedBox(height: 20),
                    CourseCarousel(),
                    SizedBox(height: 20),
                    FooterWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
