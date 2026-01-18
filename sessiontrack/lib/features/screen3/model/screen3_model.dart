class Screen3Model {
  String username;
  String email;
  bool notificationsEnabled;

  Screen3Model({
    required this.username,
    required this.email,
    this.notificationsEnabled = true,
  });
}
