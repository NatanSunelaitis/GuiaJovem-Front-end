import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../user_provider.dart';
import 'login_dialog.dart';
import 'profile_dialog.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('lib/assets/image/logo.png', height: 50),
                if (constraints.maxWidth > 600) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/');
                        },
                        child: Text('Início', style: TextStyle(fontSize: 16)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/programs');
                        },
                        child: Text('Programas de Entrada', style: TextStyle(fontSize: 16)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/universities');
                        },
                        child: Text('Universidades', style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                  userProvider.isLoggedIn ? _buildProfileButton(context) : _buildLoginButton(context),
                ] else ...[
                  IconButton(
                    icon: Icon(Icons.menu, color: Colors.blue),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return LoginDialog();
          },
        );
      },
      child: Text('Entrar'),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.blue,
        side: BorderSide(color: Colors.blue),
      ),
    );
  }

  Widget _buildProfileButton(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ProfileDialog(role: userProvider.role);
          },
        );
      },
      child: Text('Perfil'),
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.blue,
        side: BorderSide(color: Colors.blue),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.0);
}
