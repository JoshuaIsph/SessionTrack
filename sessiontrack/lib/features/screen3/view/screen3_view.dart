import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/screen3_viewmodel.dart';

class Screen3View extends StatelessWidget {
  const Screen3View({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<Screen3ViewModel>();

    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Account Overview",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),

            // Username
            Text(
              "Username: ${viewModel.user.username}",
              style: const TextStyle(color: Colors.white70, fontSize: 18),
            ),
            const SizedBox(height: 8),

            // Email
            Text(
              "Email: ${viewModel.user.email}",
              style: const TextStyle(color: Colors.white70, fontSize: 18),
            ),
            const SizedBox(height: 24),

            // Notifications toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Notifications",
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ),
                Switch(
                  value: viewModel.user.notificationsEnabled,
                  onChanged: (val) => viewModel.toggleNotifications(),
                  activeColor: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
