import 'package:flutter/material.dart';

class Step2UniversityRegistration extends StatelessWidget {
  final VoidCallback onNext;

  Step2UniversityRegistration({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: EdgeInsets.all(16),
      content: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(maxWidth: 500),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Cadastre sua Universidade!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ..._buildTextFields(),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  print("Proceeding to next step from Step2UniversityRegistration");
                  onNext();
                },
                child: Text('Próximo →'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTextFields() {
    return [
      _buildTextField('Razão social:'),
      _buildTextField('CNPJ:'),
      _buildTextField('Crie uma senha:'),
      _buildTextField('Telefone principal:'),
      _buildTextField('Digite um e-mail para cadastro:'),
      _buildTextField('Digite novamente a senha:'),
      _buildTextField('Cole aqui o link da página inicial de sua universidade:'),
      _buildTextField('Cole aqui o link para simulados anteriores de sua universidade:'),
    ];
  }

  Widget _buildTextField(String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}

