import 'package:flutter/material.dart';

class ScannerOverlay extends StatelessWidget {
  const ScannerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Column(
        children: [
          const SizedBox(height: 100),
          Center(
            child: Container(
              width: 260,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white54, width: 2),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Place the barcode in the box above',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
