import 'package:flutter/material.dart';
import '../model/screen2_model.dart';

class Screen2ViewModel extends ChangeNotifier {
  // Screen2 state
  Screen2Model _data = Screen2Model(
    title: "Screen 2",
    description: "This is the second screen.",
  );

  Screen2Model get data => _data;

  // Update the title
  void updateTitle(String newTitle) {
    _data.title = newTitle;
    notifyListeners(); // Notifies the UI to rebuild
  }

  // Update the description
  void updateDescription(String newDescription) {
    _data.description = newDescription;
    notifyListeners();
  }

  // Example action
  void exampleAction() {
    debugPrint('Screen2 action executed');
  }
}
