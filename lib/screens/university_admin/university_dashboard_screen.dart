import 'package:flutter/material.dart';
import 'university_info_screen.dart';
import 'university_course_management_screen.dart';
import 'university_campus_management_screen.dart';
import 'university_admission_program_screen.dart';
import 'university_scholarship_program_screen.dart';
import 'university_suggestions_screen.dart';
import 'package:guia_jovem/shared/widgets/navbar.dart';

class UniversityDashboardScreen extends StatefulWidget {
  @override
  _UniversityDashboardScreenState createState() => _UniversityDashboardScreenState();
}

class _UniversityDashboardScreenState extends State<UniversityDashboardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: Column(
        children: [
          Container(
            color: Colors.blue,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: Text(
                'Painel de Administração da Universidade',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          TabBar(
            controller: _tabController,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(icon: Icon(Icons.info), text: 'Informações'),
              Tab(icon: Icon(Icons.book), text: 'Cursos'),
              Tab(icon: Icon(Icons.location_city), text: 'Campus'),
              Tab(icon: Icon(Icons.school), text: 'Programas de Entrada'),
              Tab(icon: Icon(Icons.money), text: 'Bolsas de Estudo'),
              Tab(icon: Icon(Icons.feedback), text: 'Sugestões'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                UniversityInfoScreen(),
                UniversityCourseManagementScreen(),
                UniversityCampusManagementScreen(),
                UniversityAdmissionProgramScreen(),
                UniversityScholarshipProgramScreen(),
                UniversitySuggestionsScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
