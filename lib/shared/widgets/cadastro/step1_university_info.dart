import 'package:flutter/material.dart';

class Step1UniversityInfo extends StatefulWidget {
  final VoidCallback onNext;

  Step1UniversityInfo({required this.onNext});

  @override
  _Step1UniversityInfoState createState() => _Step1UniversityInfoState();
}

class _Step1UniversityInfoState extends State<Step1UniversityInfo> {
  bool agreeTerms = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Atenção!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Text(
          'Para segurança dos alunos, todos os cadastros de universidades passam por uma avaliação pela nossa equipe administrativa.',
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          'Por isso, no cadastro, é necessário informar algumas informações da instituição, como CNPJ, endereço dos campus, entre outros.',
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          'Estes dados serão utilizados somente na validação da universidade pela nossa equipe.',
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        Text(
          'Após o cadastro, em até 15 dias úteis você receberá no e-mail de cadastro a aprovação do cadastro ou solicitação de revisão nas informações digitadas.',
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Checkbox(
              value: agreeTerms,
              onChanged: (value) {
                setState(() {
                  agreeTerms = value!;
                });
              },
            ),
            Expanded(
              child: Text(
                'Concordo com os termos e condições',
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: agreeTerms ? () {
            print("Proceeding to next step from Step1UniversityInfo");
            widget.onNext();
          } : null,
          child: Text('Prosseguir'),
          style: ElevatedButton.styleFrom(
            primary: agreeTerms ? Colors.blue : Colors.grey,
            onPrimary: Colors.white,
            minimumSize: Size(double.infinity, 50),
          ),
        ),
      ],
    );
  }
}
