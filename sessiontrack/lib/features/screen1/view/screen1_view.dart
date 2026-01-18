import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/screen1_viewmodel.dart';

class Screen1View extends StatelessWidget {
  const Screen1View({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<Screen1ViewModel>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: const Center(
        child: Text(
          'Welcome to Screen 1!',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Track Session Button
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
                viewModel.trackSession(); // Call ViewModel method
              },
              child: const Text(
                'Track Session',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),

            // Circular "+" Button
            FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                viewModel.addItem(); // Call ViewModel method
              },
              child: const Icon(Icons.add, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
