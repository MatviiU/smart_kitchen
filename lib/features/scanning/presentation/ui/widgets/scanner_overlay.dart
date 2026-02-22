import 'package:flutter/material.dart';

class ScannerOverlay extends StatelessWidget {
  const ScannerOverlay({required this.isDetected, super.key});

  final bool isDetected;

  @override
  Widget build(BuildContext context) {
    final borderColor = isDetected ? Colors.greenAccent : Colors.white54;
    final borderWidth = isDetected ? 3.5 : 2.0;
    final message = isDetected
        ? 'Barcode detected'
        : 'Place the barcode in the box above';

    return IgnorePointer(
      child: Column(
        children: [
          const SizedBox(height: 100),
          Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOut,
              width: 260,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor, width: borderWidth),
                boxShadow: isDetected
                    ? [
                        BoxShadow(
                          color: Colors.greenAccent.withValues(alpha: 0.35),
                          blurRadius: 16,
                          spreadRadius: 2,
                        ),
                      ]
                    : const [],
              ),
            ),
          ),
          const SizedBox(height: 12),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 220),
            child: Text(
              message,
              key: ValueKey(message),
              style: TextStyle(
                color: isDetected ? Colors.greenAccent : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
