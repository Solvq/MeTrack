import 'package:flutter/material.dart';
import '../../../models/goal.dart';

class HabitWidget extends StatelessWidget {
  final Goal habit;

  const HabitWidget({super.key, required this.habit});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              habit.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text('Серия: ${habit.streak} 🔥'),

            const SizedBox(height: 12),

            Row(
              children: List.generate(7, (index) {
                return Container(
                  margin: const EdgeInsets.only(right: 6),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: index < habit.streak
                        ? Colors.green
                        : Colors.grey.shade300,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
