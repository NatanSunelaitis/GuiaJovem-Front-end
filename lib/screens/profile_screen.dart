import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:guia_jovem/shared/user_provider.dart';
import 'package:guia_jovem/shared/widgets/navbar.dart';
import 'package:guia_jovem/screens/change_password_dialog.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final isAluno = userProvider.role == 'aluno';

    return Scaffold(
      appBar: Navbar(),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 600), // Define a largura máxima
          padding: EdgeInsets.all(16.0), // Adiciona preenchimento ao redor do conteúdo
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50),
              ),
              SizedBox(height: 16),
              Center(
                child: IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () {
                    // Implementar lógica para alterar foto
                  },
                ),
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
              ),
              SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Implementar lógica para editar perfil
                },
                child: Text('Editar Perfil'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ChangePasswordDialog();
                    },
                  );
                },
                child: Text('Alterar Senha'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                ),
              ),
              if (isAluno) ...[
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/aluno_historico_sugestoes');
                  },
                  child: Text('Histórico de Sugestões'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/aluno_faculdades_salvas');
                  },
                  child: Text('Faculdades Salvas'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                  ),
                ),
              ],
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Implementar lógica para deslogar
                  userProvider.logout();
                  Navigator.of(context).pop();
                },
                child: Text('Sair'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
