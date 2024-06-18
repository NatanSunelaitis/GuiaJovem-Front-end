import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../user_provider.dart';
import 'cadastro/signup_dialog.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: EdgeInsets.all(16),
      content: Container(
        constraints: BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Acesse sua conta!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'Para acessar sua conta no Guia Jovem, entre com seu e-mail e senha:',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Seu e-mail',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Sua senha',
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                String email = emailController.text;
                String password = passwordController.text;
                String role = '';

                // Mocked login logic
                if (email == 'aluno@teste.com' && password == '123456') {
                  role = 'aluno';
                } else if (email == 'universidade@teste.com' && password == '123456') {
                  role = 'universidade';
                } else if (email == 'admin@teste.com' && password == '123456') {
                  role = 'admin';
                } else {
                  // Show error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Email ou senha incorretos')),
                  );
                  return;
                }

                // Update user state
                Provider.of<UserProvider>(context, listen: false).login(role);

                // Close dialog
                Navigator.of(context).pop();
              },
              child: Text('Acessar minha conta'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fechar o dialogo de login
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SignupDialog(); // Abrir o dialogo de signup
                  },
                );
              },
              child: Text('Ainda não tem conta? Crie uma conta'),
              style: TextButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            Text('OU', style: TextStyle(fontSize: 16)),
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
    );
  }
}
