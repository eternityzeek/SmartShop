import 'package:flutter/material.dart';
import '../widgets/drawer_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      drawer: buildAppDrawer(context),
      body: const Center(
        child: Text(
          'User Profile\n\nMore features can be added here.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
