import 'package:flutter/material.dart';
import '../../../models/goal.dart';

class AddWidgetSheet extends StatefulWidget {
  final Function(Goal) onAdd;

  const AddWidgetSheet({super.key, required this.onAdd});

  @override
  State<AddWidgetSheet> createState() => _AddWidgetSheetState();
}

class _AddWidgetSheetState extends State<AddWidgetSheet> {
  GoalType selectedType = GoalType.habit;
  final TextEditingController titleController = TextEditingController();
  int repeatEveryDays = 1;

  void _submit() {
    if (titleController.text.isEmpty) return;

    widget.onAdd(
      Goal(
        type: selectedType,
        title: titleController.text,
        repeatEveryDays: repeatEveryDays,
      ),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Добавить цель',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Название цели',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              ChoiceChip(
                label: const Text('Привычка'),
                selected: selectedType == GoalType.habit,
                onSelected: (_) {
                  setState(() => selectedType = GoalType.habit);
                },
              ),
              const SizedBox(width: 8),
              ChoiceChip(
                label: const Text('Деньги'),
                selected: selectedType == GoalType.money,
                onSelected: (_) {
                  setState(() => selectedType = GoalType.money);
                },
              ),
            ],
          ),

          if (selectedType == GoalType.habit) ...[
            const SizedBox(height: 16),

            DropdownButtonFormField<int>(
              initialValue: repeatEveryDays,
              items: const [
                DropdownMenuItem(value: 1, child: Text('Каждый день')),
                DropdownMenuItem(value: 2, child: Text('Через день')),
                DropdownMenuItem(value: 3, child: Text('Каждые 3 дня')),
              ],
              onChanged: (value) {
                setState(() => repeatEveryDays = value!);
              },
              decoration: const InputDecoration(
                labelText: 'Повтор',
                border: OutlineInputBorder(),
              ),
            ),
          ],

          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: _submit,
            child: const Text('Добавить'),
          ),
        ],
      ),
    );
  }
}
