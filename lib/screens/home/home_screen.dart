import 'package:flutter/material.dart';
import '../../models/goal.dart';
import '../widgets/home/add_widget_sheet.dart';
import '../widgets/home/habit_wiget.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Goal> goals = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) {
              return AddWidgetSheet(
                onAdd: (goal) {
                  setState(() {
                    goals.add(goal);
                  });
                },
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (_) {},
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 32),
            color: Colors.blueGrey.shade200,
            child: const Center(
              child: CircleAvatar(radius: 36),
            ),
          ),
          const Divider(height: 1),
          Expanded(
            child: goals.isEmpty
                ? const Center(
                    child: Text(
                      'Добавь свою первую цель',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: goals.length,
                    itemBuilder: (context, index) {
                      final goal = goals[index];

                      if (goal.type == GoalType.habit) {
                        return HabitWidget(habit: goal);
                      }

                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: ListTile(
                          title: Text(goal.title),
                          subtitle: const Text('Финансовая цель'),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
