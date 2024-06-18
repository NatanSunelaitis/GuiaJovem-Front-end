/*import 'package:flutter/material.dart';
import 'package:guia_jovem/screens/login/login_screen.dart';
import 'package:guia_jovem/screens/sign_in/sign_in_screen.dart';
import 'package:guia_jovem/screens/home/home_screen.dart';
import 'package:guia_jovem/screens/university/university_list_screen.dart';
import 'package:guia_jovem/screens/university/university_detail_screen.dart';
import 'package:guia_jovem/screens/suggestions/suggestions_screen.dart';

class AppRoutes {
  static const login = '/login';
  static const signIn = '/sign_in';
  static const home = '/home';
  static const universities = '/universities';
  static const universityDetail = '/university_detail';
  static const suggestions = '/suggestions';

  static Map<String, WidgetBuilder> routes = {
    login: (context) => LoginScreen(),
    signIn: (context) => SignInScreen(),
    home: (context) => HomeScreen(),
    universities: (context) => UniversityListScreen(),
    universityDetail: (context) => UniversityDetailScreen(),
    suggestions: (context) => SuggestionsScreen(),
  };
}*/

import 'package:flutter/material.dart';
import 'package:guia_jovem/screens/sign_in/sign_in_screen.dart';
import 'package:guia_jovem/screens/home/home_screen.dart';
import 'package:guia_jovem/screens/university/university_list_screen.dart';
import 'package:guia_jovem/screens/university/university_detail_screen.dart';
import 'package:guia_jovem/screens/suggestions/suggestions_screen.dart';

class AppRoutes {
  static const signIn = '/sign_in';
  static const home = '/home';
  static const universities = '/universities';
  static const universityDetail = '/university_detail';
  static const suggestions = '/suggestions';

  static Map<String, WidgetBuilder> routes = {
    signIn: (context) => SignInScreen(),
    home: (context) => HomeScreen(),
    universities: (context) => UniversityListScreen(),
    universityDetail: (context) => UniversityDetailScreen(),
    suggestions: (context) => SuggestionsScreen(),
  };
}


