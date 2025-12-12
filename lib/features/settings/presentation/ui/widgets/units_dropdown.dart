import 'package:flutter/material.dart';
import 'package:smart_kitchen/domain/entities/settings_entity.dart';

class UnitsDropdown extends StatelessWidget {
  const UnitsDropdown({
    required this.measurementUnit,
    required this.onUnitChanged,
    super.key,
  });

  final MeasurementUnit measurementUnit;
  final ValueChanged<MeasurementUnit> onUnitChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<MeasurementUnit>(
      value: measurementUnit,
      items: const [
        DropdownMenuItem(value: MeasurementUnit.metric, child: Text('Metric')),
        DropdownMenuItem(
          value: MeasurementUnit.imperial,
          child: Text('Imperial'),
        ),
      ],
      onChanged: (unit) {
        if (unit == null) return;
        onUnitChanged(unit);
      },
      underline: const SizedBox.shrink(),
    );
  }
}
