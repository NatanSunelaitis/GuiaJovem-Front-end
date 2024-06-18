import 'package:flutter/material.dart';

class StudentSignup extends StatelessWidget {
  final VoidCallback onNext;

  StudentSignup({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: EdgeInsets.all(16),
      content: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Vamos criar sua conta no Guia Jovem?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'É só informar seu e-mail e uma senha:',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              _buildTextField('Cadastre seu e-mail', 'Ex: email@email.com', false),
              SizedBox(height: 16),
              _buildTextField('Crie uma senha', 'Por favor, informe uma senha com 7 ou mais caracteres', true),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Implementar lógica de cadastro
                  onNext();
                },
                child: Text('Criar minha conta'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
              SizedBox(height: 16),
              Text('Se você já tem uma conta, entre por aqui', style: TextStyle(fontSize: 14)),
              SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  // Implementar lógica de login com Google
                },
                icon: Image.asset(
                  'lib/assets/image/google_icon.png',
                  height: 24,
                  width: 24,
                ),
                label: Text('Entrar com Google'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hintText, bool obscureText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
        SizedBox(height: 8),
        Text(
          obscureText
              ? 'Por favor, informe uma senha com 7 ou mais caracteres'
              : 'Por favor, informe um e-mail válido',
          style: TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}
