import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:guia_jovem/screens/home/home_screen.dart';
import 'package:guia_jovem/screens/university/university_list_screen.dart';
import 'package:guia_jovem/screens/programs/program_list_screen.dart';
import 'package:guia_jovem/shared/user_provider.dart';
import 'package:guia_jovem/screens/profile_screen.dart';
import 'package:guia_jovem/screens/admin/admin_dashboard_screen.dart';
import 'package:guia_jovem/screens/admin/user_management_screen.dart';
import 'package:guia_jovem/screens/admin/university_management_screen.dart';
import 'package:guia_jovem/screens/admin/admin_course_management_screen.dart';
import 'package:guia_jovem/screens/admin/admin_financing_program_screen.dart';
import 'package:guia_jovem/screens/admin/admin_scholarship_program_screen.dart';
import 'package:guia_jovem/screens/admin/admin_suggestions_screen.dart';
import 'package:guia_jovem/screens/admin/admin_statistics_screen.dart';
import 'package:guia_jovem/screens/university_admin/university_dashboard_screen.dart';
import 'package:guia_jovem/screens/university_admin/university_info_screen.dart';
import 'package:guia_jovem/screens/university_admin/university_campus_management_screen.dart';
import 'package:guia_jovem/screens/university_admin/university_admission_program_screen.dart';
import 'package:guia_jovem/screens/university_admin/university_course_management_screen.dart';
import 'package:guia_jovem/screens/university_admin/university_financing_program_screen.dart';
import 'package:guia_jovem/screens/university_admin/university_scholarship_program_screen.dart';
import 'package:guia_jovem/screens/university_admin/university_suggestions_screen.dart';
import 'package:guia_jovem/shared/widgets/navbar.dart';

void main() {
  runApp(GuiaJovemApp());
}

class GuiaJovemApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        title: 'Guia Jovem',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/home',
        routes: {
          '/home': (context) => HomeScreenWithNavbar(),
          '/universities': (context) => UniversityListScreenWithNavbar(),
          '/profile': (context) => ProfileScreen(),
          '/admin': (context) => AdminDashboardScreen(),
          '/user_management': (context) => UserManagementScreen(),
          '/university_management': (context) => UniversityManagementScreen(),
          '/admin_course_management': (context) => AdminCourseManagementScreen(),
          '/admin_financing_programs': (context) => AdminFinancingProgramScreen(),
          '/admin_scholarship_programs': (context) => AdminScholarshipProgramScreen(),
          '/admin_suggestions': (context) => AdminSuggestionsScreen(),
          '/admin_statistics': (context) => AdminStatisticsScreen(),
          '/university_admin': (context) => UniversityDashboardScreen(),
          '/university_info': (context) => UniversityInfoScreen(),
          '/university_campus_management': (context) => UniversityCampusManagementScreen(),
          '/university_admission_programs': (context) => UniversityAdmissionProgramScreen(),
          '/university_course_management': (context) => UniversityCourseManagementScreen(),
          '/university_financing_programs': (context) => UniversityFinancingProgramScreen(),
          '/university_scholarship_programs': (context) => UniversityScholarshipProgramScreen(),
          '/university_suggestions': (context) => UniversitySuggestionsScreen(),
          '/programs': (context) => ProgramListScreenWithNavbar(),
        },
      ),
    );
  }
}

class HomeScreenWithNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: HomeScreen(),
    );
  }
}

class UniversityListScreenWithNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: UniversityListScreen(),
    );
  }
}

class ProgramListScreenWithNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: ProgramListScreen(),
    );
  }
}
