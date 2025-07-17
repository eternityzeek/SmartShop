import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../providers/theme_provider.dart';

Drawer buildAppDrawer(BuildContext context) {
  final authProvider = Provider.of<AuthProvider>(context, listen: false);
  final themeProvider = Provider.of<ThemeProvider>(context);

  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Text(
            'Smart Shop',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () => Navigator.pushReplacementNamed(context, '/home'),
        ),
        ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: const Text('Cart'),
          onTap: () => Navigator.pushReplacementNamed(context, '/cart'),
        ),
        ListTile(
          leading: const Icon(Icons.favorite),
          title: const Text('Favorites'),
          onTap: () => Navigator.pushReplacementNamed(context, '/favorites'),
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Profile'),
          onTap: () => Navigator.pushReplacementNamed(context, '/profile'),
        ),
        const Divider(),
        SwitchListTile(
          title: const Text('Dark Mode'),
          value: themeProvider.isDark,
          onChanged: (value) {
            themeProvider.toggleTheme();
          },
          secondary: const Icon(Icons.brightness_6),
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            authProvider.logout();
            Navigator.pushReplacementNamed(context, '/login');
          },
        ),
      ],
    ),
  );
}
