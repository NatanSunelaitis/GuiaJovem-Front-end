import 'package:flutter/material.dart';

class Step3Programs extends StatelessWidget {
  final VoidCallback onNext;

  Step3Programs({required this.onNext});

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
                'Adicione os programas de entrada aceitos por sua instituição!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              _buildTextField('Programas de Financiamento'),
              SizedBox(height: 16),
              _buildTextField('Bolsas de Estudos'),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  print("Proceeding to next step from Step3Programs");
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

  Widget _buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}

