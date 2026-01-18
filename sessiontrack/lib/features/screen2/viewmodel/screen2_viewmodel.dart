import 'package:flutter/material.dart';
import '../model/screen2_model.dart';

class Screen2ViewModel extends ChangeNotifier {
  // List of months
  final List<MonthlyStatistics> _monthlyData = [
    MonthlyStatistics(
      month: "January",
      totalSessionTime: "12h 34m",
      numberOfSessions: 27,
      averageSessionTime: "28m",
      longestSession: "1h 15m",
      sessions: [
        Session(date: "2026-01-01", duration: "30m"),
        Session(date: "2026-01-02", duration: "45m"),
        Session(date: "2026-01-03", duration: "1h 5m"),
      ],
    ),
    MonthlyStatistics(
      month: "February",
      totalSessionTime: "10h 12m",
      numberOfSessions: 20,
      averageSessionTime: "30m",
      longestSession: "1h 0m",
      sessions: [
        Session(date: "2026-02-01", duration: "25m"),
        Session(date: "2026-02-02", duration: "40m"),
      ],
    ),
    // Add more months
  ];

  List<MonthlyStatistics> get monthlyData => _monthlyData;

  int _currentMonthIndex = 0;

  MonthlyStatistics get currentMonthData => _monthlyData[_currentMonthIndex];
  String get currentMonth => _monthlyData[_currentMonthIndex].month;

  void setMonth(int index) {
    if (index >= 0 && index < _monthlyData.length) {
      _currentMonthIndex = index;
      notifyListeners();
    }
  }
}
