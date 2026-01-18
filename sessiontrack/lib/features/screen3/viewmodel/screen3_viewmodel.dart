import 'package:flutter/material.dart';
import '../model/screen3_model.dart';

class Screen3ViewModel extends ChangeNotifier {
  Screen3Model _user = Screen3Model(
    username: "John Doe",
    email: "john@example.com",
  );

  Screen3Model get user => _user;

  // Toggle notifications
  void toggleNotifications() {
    _user.notificationsEnabled = !_user.notificationsEnabled;
    notifyListeners();
  }

  // Update username
  void updateUsername(String newName) {
    _user.username = newName;
    notifyListeners();
  }

  // Update email
  void updateEmail(String newEmail) {
    _user.email = newEmail;
    notifyListeners();
  }
}
