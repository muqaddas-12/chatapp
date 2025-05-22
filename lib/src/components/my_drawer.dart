

import 'package:chatapp/src/pages/settings_page.dart';
import 'package:chatapp/src/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Top items: Header, Home, Settings
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    color: Theme.of(context).colorScheme.primary,
                    size: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ListTile(
                  title: const Text("H O M E"),
                  leading: Icon(Icons.home,
                   color: Theme.of(context).colorScheme.primary,
                  ),
                  onTap: () {
                    // Navigate to Home or handle action
                    Navigator.pop(context); // Close the drawer
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ListTile(
                  title: const Text("S E T T I N G S"),
                  leading:  Icon(Icons.settings,
                   color: Theme.of(context).colorScheme.primary,
                  ),
                  onTap: () {
                    // Navigate to Settings or handle action
                    Navigator.pop(context);
                    Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context) =>  SettingsPage(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          // Bottom item: Logout
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
            child: ListTile(
              title: const Text("L O G O U T"),
              leading:  Icon(Icons.logout,
               color: Theme.of(context).colorScheme.primary,
              ),
              onTap: (){
                logout();
              }
            ),
          ),
        ],
      ),
    );
  }
}
