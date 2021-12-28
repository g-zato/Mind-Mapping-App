import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Usuário teste'),
            accountEmail: Text('teste@teste.com.br'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(),
            ),
          ),
          ListTile(
            leading: Icon(Icons.access_alarm_rounded),
            title: Text('Item do menu'),
            onTap: () => null,
          )
        ],
      ),
    );
  }
}
