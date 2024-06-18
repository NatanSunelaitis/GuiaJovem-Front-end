import 'package:flutter/material.dart';
import 'user_management_screen.dart';
import 'university_management_screen.dart';
import 'admin_course_management_screen.dart';
import 'admin_financing_program_screen.dart';
import 'admin_scholarship_program_screen.dart';
import 'admin_suggestions_screen.dart';
import 'admin_statistics_screen.dart';
import 'package:guia_jovem/shared/widgets/navbar.dart';

class AdminDashboardScreen extends StatefulWidget {
  @override
  _AdminDashboardScreenState createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
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
                'Painel de Administração',
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
              Tab(icon: Icon(Icons.dashboard), text: 'Dashboard'),
              Tab(icon: Icon(Icons.person), text: 'Usuários'),
              Tab(icon: Icon(Icons.school), text: 'Universidades'),
              Tab(icon: Icon(Icons.book), text: 'Cursos'),
              Tab(icon: Icon(Icons.attach_money), text: 'Financiamentos'),
              Tab(icon: Icon(Icons.money), text: 'Bolsas de Estudo'),
              Tab(icon: Icon(Icons.feedback), text: 'Sugestões'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                AdminStatisticsScreen(),
                UserManagementScreen(),
                UniversityManagementScreen(),
                AdminCourseManagementScreen(),
                AdminFinancingProgramScreen(),
                AdminScholarshipProgramScreen(),
                AdminSuggestionsScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
