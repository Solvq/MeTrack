enum GoalType {
  habit,
  money,
}

class Goal {
  final GoalType type;
  final String title;
  final int repeatEveryDays;
  final int streak;

  Goal({
    required this.type,
    required this.title,
    required this.repeatEveryDays,
    this.streak = 0,
  });
}
