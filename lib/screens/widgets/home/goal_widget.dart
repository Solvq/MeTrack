import 'package:flutter/material.dart';
import '../../../models/goal.dart';

class GoalWidget extends StatelessWidget {
  final Goal goal;

  const GoalWidget({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(goal.title),
        subtitle: goal.type == GoalType.habit
            ? Text('Повтор каждые ${goal.repeatEveryDays} дн.')
            : const Text('Финансовая цель'),
      ),
    );
  }
}

