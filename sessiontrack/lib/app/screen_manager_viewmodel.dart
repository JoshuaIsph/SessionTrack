import 'package:flutter/material.dart';

class ScreenManagerViewModel extends ChangeNotifier {
  int _currentPage = 0;

  // Titles for all screens
  final List<String> _titles = ['Home', 'Overview', 'Account'];

  int get currentPage => _currentPage;
  String get currentTitle => _titles[_currentPage];

  void setPage(int page) {
    if (_currentPage != page) {
      _currentPage = page;
      notifyListeners(); // Notifies UI to rebuild AppBar title
    }
  }
}
