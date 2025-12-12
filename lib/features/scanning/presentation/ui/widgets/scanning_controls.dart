import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:smart_kitchen/features/scanning/presentation/cubit/scanner_cubit.dart';
import 'package:smart_kitchen/features/scanning/presentation/cubit/scanner_state.dart';

class ScanningControls extends StatelessWidget {
  const ScanningControls({required this.cameraController, super.key});

  final MobileScannerController cameraController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScannerCubit, ScannerState>(
      builder: (context, state) {
        final torchOn = state is ScannerReady && state.torchOn;
        return Row(
          children: [
            Material(
              color: Colors.black38,
              shape: const CircleBorder(),
              child: IconButton(
                color: Colors.white,
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).maybePop(),
              ),
            ),
            const SizedBox(width: 8),
            Material(
              color: Colors.black38,
              shape: const CircleBorder(),
              child: IconButton(
                color: Colors.white,
                icon: Icon(torchOn ? Icons.flash_on : Icons.flash_off),
                onPressed: () async {
                  try {
                    await cameraController.toggleTorch();
                    if (!context.mounted) return;
                    context.read<ScannerCubit>().setTorch(torchOn: !torchOn);
                  } catch (e) {
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Unable to switch the flashlight'),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
