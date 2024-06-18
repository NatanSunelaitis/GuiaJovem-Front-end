import 'package:flutter/material.dart';

class Step4CampusRegistration extends StatelessWidget {
  final VoidCallback onNext;

  Step4CampusRegistration({required this.onNext});

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
                'Cadastre seu primeiro Campus!',
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
                  print("Proceeding to next step from Step4CampusRegistration");
                  onNext();
                },
                child: Text('Cadastrar'),
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
      _buildTextField('Nome do campus:'),
      _buildTextField('Logradouro:'),
      _buildTextField('Bairro:'),
      _buildTextField('Cidade:'),
      _buildTextField('telefone:'),
      _buildTextField('Número:'),
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

