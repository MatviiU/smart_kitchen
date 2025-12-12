import 'package:flutter/material.dart';

class ExpirySelector extends StatelessWidget {
  const ExpirySelector({
    required this.notificationExpiryDays,
    required this.onExpiryChanged,
    super.key,
  });

  final int notificationExpiryDays;
  final ValueChanged<int> onExpiryChanged;

  @override
  Widget build(BuildContext context) {
    final options = [1, 3, 7, 14, 30];
    return DropdownButton<int>(
      value: notificationExpiryDays,
      items: options
          .map((day) => DropdownMenuItem(value: day, child: Text('$day')))
          .toList(),
      onChanged: (day) {
        if (day == null) return;
        onExpiryChanged(day);
      },
      underline: const SizedBox.shrink(),
    );
  }
}
