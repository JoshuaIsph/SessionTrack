import 'package:flutter/material.dart';

class Screen1ViewModel extends ChangeNotifier {
  // Example state (optional)
  int itemsCount = 0;

  // Called when "Track Session" button is pressed
  void trackSession() {
    // TODO: implement your tracking logic
    debugPrint('Track Session button pressed');
  }

  // Called when "+" button is pressed
  void addItem() {
    itemsCount += 1;
    debugPrint('Added item #$itemsCount');
    notifyListeners(); // notify UI if needed
  }
}
