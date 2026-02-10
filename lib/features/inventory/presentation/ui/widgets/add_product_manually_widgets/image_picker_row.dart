import 'package:flutter/material.dart';

class ImagePickerRow extends StatelessWidget {
  const ImagePickerRow({
    required this.onTakePhoto,
    required this.onUploadFromDevice,
    super.key,
  });

  final VoidCallback onTakePhoto;
  final VoidCallback onUploadFromDevice;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onTakePhoto,
            child: const Text('Take photo'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton(
            onPressed: onUploadFromDevice,
            child: const Text('Upload from device'),
          ),
        ),
      ],
    );
  }
}
