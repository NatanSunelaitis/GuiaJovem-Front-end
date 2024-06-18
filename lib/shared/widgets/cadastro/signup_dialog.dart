import 'package:flutter/material.dart';
import 'step1_university_info.dart';
import 'step2_university_registration.dart';
import 'step3_programs.dart';
import 'step4_campus_registration.dart';
import 'student_signup.dart';

class SignupDialog extends StatefulWidget {
  const SignupDialog({Key? key}) : super(key: key);

  @override
  _SignupDialogState createState() => _SignupDialogState();
}

class _SignupDialogState extends State<SignupDialog> {
  int currentStep = 0;
  bool isStudent = false;

  void nextStep() {
    print("Moving to next step");
    setState(() {
      currentStep++;
    });
  }

  void goToStep(int step) {
    setState(() {
      currentStep = step;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget getStepWidget(int step) {
      if (isStudent) {
        return StudentSignup(onNext: nextStep);
      }
      switch (step) {
        case 0:
          return ChooseSignupType(
            onStudent: () {
              setState(() {
                isStudent = true;
              });
            },
            onUniversity: nextStep,
          );
        case 1:
          return Step1UniversityInfo(onNext: nextStep);
        case 2:
          return Step2UniversityRegistration(onNext: nextStep);
        case 3:
          return Step3Programs(onNext: nextStep);
        case 4:
          return Step4CampusRegistration(onNext: () {
            Navigator.of(context).pop();
          });
        default:
          return ChooseSignupType(
            onStudent: () {
              setState(() {
                isStudent = true;
              });
            },
            onUniversity: nextStep,
          );
      }
    }

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: EdgeInsets.all(16),
      content: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(maxWidth: 500),
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: getStepWidget(currentStep),
          ),
        ),
      ),
    );
  }
}

class ChooseSignupType extends StatelessWidget {
  final VoidCallback onStudent;
  final VoidCallback onUniversity;

  ChooseSignupType({required this.onStudent, required this.onUniversity});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Qual tipo de cadastro gostaria de fazer?',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Text(
          'Se você deseja ingressar futuramente em uma universidade e por isso gostaria de saber mais sobre as instituições de ensino programas de entradas e mais selecione a opção Aluno',
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: onStudent,
          child: Text('Aluno'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            onPrimary: Colors.white,
            minimumSize: Size(double.infinity, 50),
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Agora se você é o representante de alguma universidade e gostaria que ela estivesse também em nosso site junto das outras universidades escolha a opção Universidade',
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: onUniversity,
          child: Text('Universidade'),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            onPrimary: Colors.white,
            minimumSize: Size(double.infinity, 50),
          ),
        ),
      ],
    );
  }
}


