import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/screen3_viewmodel.dart';

class Screen3View extends StatelessWidget {
  const Screen3View({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<Screen3ViewModel>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display only username in big text
            Text(
              viewModel.user.username,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),

            // Settings options
            Expanded(
              child: ListView(
                children: [
                  _buildSettingItem(
                    context,
                    title: "Account Settings",
                    icon: Icons.person,
                    onTap: () {
                      // Navigate to Account Settings page (not implemented yet)
                    },
                  ),
                  _buildSettingItem(
                    context,
                    title: "Privacy Settings",
                    icon: Icons.lock,
                    onTap: () {
                      // Navigate to Privacy Settings page (not implemented yet)
                    },
                  ),
                  _buildSettingItem(
                    context,
                    title: "Notification Settings",
                    icon: Icons.notifications,
                    onTap: () {
                      // Navigate to Notification Settings page (not implemented yet)
                    },
                  ),
                  _buildSettingItem(
                    context,
                    title: "Help & Support",
                    icon: Icons.help,
                    onTap: () {
                      // Navigate to Help page (not implemented yet)
                    },
                  ),
                  // Add more settings here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context, {
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white70,
          size: 16,
        ),
        onTap: onTap,
      ),
    );
  }
}
