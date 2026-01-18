import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/screen1/view/screen1_view.dart';
import '../features/screen2/view/screen2_view.dart';
import '../features/screen3/view/screen3_view.dart';
import 'screen_manager_viewmodel.dart';

class ScreenManager extends StatelessWidget {
  const ScreenManager({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ScreenManagerViewModel>();
    final pageController = PageController(initialPage: viewModel.currentPage);

    final titles = ['Home', 'Overview', 'Account'];

    return Scaffold(
      body: Column(
        children: [
          // Persistent titles row
          Container(
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: titles.map((title) {
                    final index = titles.indexOf(title);
                    final isActive = index == viewModel.currentPage;

                    return Text(
                      title,
                      style: TextStyle(
                        color: isActive ? Colors.white : Colors.white54,
                        fontSize: 18,
                        fontWeight: isActive
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 4),
                // Dynamic underline
                Stack(
                  children: [
                    Container(height: 2, color: Colors.white12),
                    AnimatedAlign(
                      alignment: Alignment(
                        -1.0 + 1.0 * viewModel.currentPage,
                        0,
                      ),
                      duration: const Duration(milliseconds: 300),
                      child: Container(
                        width:
                            MediaQuery.of(context).size.width / titles.length,
                        height: 2,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // PageView
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) => viewModel.setPage(index),
              children: const [Screen1View(), Screen2View(), Screen3View()],
            ),
          ),
        ],
      ),
    );
  }
}
