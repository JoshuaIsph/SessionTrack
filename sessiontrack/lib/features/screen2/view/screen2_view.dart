import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodel/screen2_viewmodel.dart';

class Screen2View extends StatelessWidget {
  const Screen2View({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<Screen2ViewModel>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),

                // Centered Statistics Header
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 24),
                    child: Text(
                      "Your Statistics",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // Horizontal Month Selector (animated fade)
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: viewModel.monthlyData.length,
                    itemBuilder: (context, index) {
                      final month = viewModel.monthlyData[index].month;
                      final isSelected = month == viewModel.currentMonth;

                      return GestureDetector(
                        onTap: () => viewModel.setMonth(index),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          margin: const EdgeInsets.only(right: 12),
                          child: AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 300),
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : Colors.grey[500],
                              fontSize: 18,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                            child: Text(month),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 32),

                // Stats Grid
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildStatBall(
                      context,
                      label: "Total Session Time",
                      value: viewModel.currentMonthData.totalSessionTime,
                      onTap: () {},
                    ),
                    _buildStatBall(
                      context,
                      label: "Number of Sessions",
                      value: viewModel.currentMonthData.numberOfSessions
                          .toString(),
                      onTap: () {},
                    ),
                    _buildStatBall(
                      context,
                      label: "Average Session Time",
                      value: viewModel.currentMonthData.averageSessionTime,
                      onTap: () {},
                    ),
                    _buildStatBall(
                      context,
                      label: "Longest Session",
                      value: viewModel.currentMonthData.longestSession,
                      onTap: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Sessions Header
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Sessions",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),

          // Session list
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final session = viewModel.currentMonthData.sessions[index];
              return Card(
                color: Colors.grey[900],
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(
                    "Session on ${session.date}",
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "Duration: ${session.duration}",
                    style: const TextStyle(color: Colors.white70),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white70,
                    size: 16,
                  ),
                  onTap: () {},
                ),
              );
            }, childCount: viewModel.currentMonthData.sessions.length),
          ),
        ],
      ),
    );
  }

  static Widget _buildStatBall(
    BuildContext context, {
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[900],
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.2),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  label,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
