import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shersoft/controller/login.dart';
import 'package:shersoft/view/home/accounts.dart';

Drawer drawer(BuildContext context) {
  return Drawer(
    child: Center(
        child: Column(
      children: [
        Container(
          color: const Color(0XFF0008B4),
          height: 250,
        ),
        ListTile(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AccountsPage())),
          title: Text("Accounts"),
          leading: Icon(Icons.groups_outlined),
        ),
        ListTile(
          title: Text("Transfer"),
          leading: Icon(Icons.track_changes),
        ),
        ListTile(
          title: Text("Backup and Restore"),
          leading: Icon(Icons.settings_backup_restore),
        ),
        ListTile(
          title: Text("Settings"),
          leading: Icon(Icons.settings_outlined),
        ),
        ListTile(
          onTap: () {
            Provider.of<UserController>(context, listen: false)
                .logoutUser(context);
          },
          title: Text("Logout"),
          leading: Icon(Icons.logout),
        )
      ],
    )),
  );
}
