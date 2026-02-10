import 'package:flutter/material.dart';
import 'package:smart_kitchen/core/theme/build_context_extension.dart';

class ExpireProgressIndicator extends StatelessWidget {
  const ExpireProgressIndicator({super.key, this.expirationDate});

  final DateTime? expirationDate;

  @override
  Widget build(BuildContext context) {
    if (expirationDate == null) return const SizedBox.shrink();
    final status = ExpirationStatus.fromDate(expirationDate!);
    final progressValue = status.getProgressValue(expirationDate!);

    return ClipRRect(
      borderRadius: .circular(8),
      child: LinearProgressIndicator(
        minHeight: 10,
        backgroundColor: context.colors.surfaceContainerHigh,
        value: progressValue,
        valueColor: AlwaysStoppedAnimation<Color>(status.color),
      ),
    );
  }
}

enum ExpirationStatus {
  expired,
  critical,
  warning,
  safe;

  Color get color {
    switch (this) {
      case .expired:
        return Colors.red;
      case .critical:
        return Colors.orange;
      case .warning:
        return Colors.yellow;
      case .safe:
        return Colors.green;
    }
  }

  static int _daysBetween(DateTime from, DateTime to) {
    final fromTemp = DateTime(from.year, from.month, from.day);
    final toTemp = DateTime(to.year, to.month, to.day);
    return toTemp.difference(fromTemp).inDays;
  }

  static ExpirationStatus fromDate(DateTime date) {
    final now = DateTime.now();
    final difference = _daysBetween(now, date);

    if (difference < 0) return .expired;
    if (difference <= 3) return .critical;
    if (difference <= 7) return .warning;
    return .safe;
  }

  double getProgressValue(DateTime date) {
    if (this == .expired) return 1.0;
    if (this == .safe) return 1.0;
    final now = DateTime.now();
    final difference = _daysBetween(now, date);
    const maxDays = 14.0;

    if (difference <= 0) return 0.15;

    return (difference / maxDays).clamp(0.15, 1.0);
  }
}
