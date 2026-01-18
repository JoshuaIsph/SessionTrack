class Session {
  final String date;
  final String duration;

  Session({required this.date, required this.duration});
}

class MonthlyStatistics {
  final String month;
  String totalSessionTime;
  int numberOfSessions;
  String averageSessionTime;
  String longestSession;
  List<Session> sessions;

  MonthlyStatistics({
    required this.month,
    required this.totalSessionTime,
    required this.numberOfSessions,
    required this.averageSessionTime,
    required this.longestSession,
    required this.sessions,
  });
}
