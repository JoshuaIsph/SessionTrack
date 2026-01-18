import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, elevation: 0),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left rectangular "Track Session" button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // TODO: Add "Track Session" action
              },
              child: const Text(
                'Track Session',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            // Right circular "+" button
            FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                // TODO: Add "+" button action
              },
              child: const Icon(Icons.add, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
