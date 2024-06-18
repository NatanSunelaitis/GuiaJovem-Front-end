import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../user_provider.dart';

class ProfileDialog extends StatelessWidget {
  final String role;

  const ProfileDialog({Key? key, required this.role}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: EdgeInsets.all(16),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: _buildOptions(context),
      ),
    );
  }

  List<Widget> _buildOptions(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    List<Widget> options = [
      ListTile(
        leading: Icon(Icons.person),
        title: Text('Visualizar Perfil'),
        onTap: () {
          Navigator.of(context).pop();
          Navigator.pushNamed(context, '/profile');
        },
      ),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text('Deslogar'),
        onTap: () {
          userProvider.logout();
          Navigator.of(context).pop();
          Navigator.of(context).pushReplacementNamed('/home');
        },
      ),
    ];

    if (role == 'universidade' || role == 'admin') {
      options.insert(1, ListTile(
        leading: Icon(Icons.admin_panel_settings),
        title: Text('Painel Administrador'),
        onTap: () {
          Navigator.of(context).pop();
          if (role == 'universidade') {
            Navigator.pushNamed(context, '/university_admin');
          } else if (role == 'admin') {
            Navigator.pushNamed(context, '/admin');
          }
        },
      ));
    }

    if (role == 'aluno' || role == 'universidade') {
      options.add(
        Divider(color: Colors.redAccent),
      );
      options.add(ListTile(
        leading: Icon(Icons.delete, color: Colors.red),
        title: Text('Excluir Conta', style: TextStyle(color: Colors.red)),
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Confirmação'),
                content: Text('Tem certeza que deseja excluir sua conta? Esta ação não pode ser desfeita.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Implementar lógica de exclusão de conta
                      userProvider.logout(); // Simulando exclusão ao deslogar
                      Navigator.of(context).pop(); // Fecha a confirmação
                      Navigator.of(context).pop(); // Fecha o dialog de perfil
                    },
                    child: Text('Excluir', style: TextStyle(color: Colors.red)),
                  ),
                ],
              );
            },
          );
        },
      ));
    }

    return options;
  }
}
