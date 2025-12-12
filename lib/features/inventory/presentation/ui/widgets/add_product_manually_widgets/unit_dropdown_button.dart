import 'package:flutter/material.dart';

class UnitDropdownButton extends StatelessWidget {
  const UnitDropdownButton({
    required this.initialValue,
    required this.onChanged,
    super.key,
  });

  final String initialValue;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DropdownButtonFormField<String>(
        initialValue: initialValue,
        items: const [
          DropdownMenuItem(value: 'pcs', child: Text('pcs')),
          DropdownMenuItem(value: 'g', child: Text('g')),
          DropdownMenuItem(value: 'ml', child: Text('ml')),
          DropdownMenuItem(value: 'oz', child: Text('oz')),
        ],
        onChanged: onChanged,
        decoration: const InputDecoration(labelText: 'Unit'),
      ),
    );
  }
}
