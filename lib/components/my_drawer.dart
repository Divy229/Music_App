import 'package:flutter/material.dart';
import 'package:musicapp/pages/settings_page.dart';
import 'package:musicapp/pages/help_support_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //logo
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.music_note,
                size: 40,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          //home title
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: ListTile(
              leading: const Icon(Icons.home),
              title: Text("H O M E"),
              onTap: () => Navigator.pop(context),
            ),
          ),
          // settings tile
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 0),
            child: ListTile(
              title: Text("S E T T I N G S"),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                //navigate to settings page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 0),
            child: ListTile(
              leading: const Icon(Icons.headphones),
              title: Text("H E L P & S U P P O R T"),
              onTap: () {
                Navigator.pop(context);
                // navigate to help & support page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpSupportPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
