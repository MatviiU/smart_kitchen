import 'package:flutter/material.dart';

class ImagePickerRow extends StatelessWidget {
  const ImagePickerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              // TODO: open camera
            },
            child: const Text('Take photo'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              // TODO: pick from device
            },
            child: const Text('Upload from device'),
          ),
        ),
      ],
    );
  }
}
