import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:smart_kitchen/features/inventory/presentation/cubit/inventory_cubit.dart';
import 'package:smart_kitchen/features/inventory/presentation/cubit/inventory_state.dart';
import 'package:smart_kitchen/features/scanning/presentation/cubit/scanner_cubit.dart';
import 'package:smart_kitchen/features/scanning/presentation/cubit/scanner_state.dart';
import 'package:smart_kitchen/features/scanning/presentation/ui/widgets/permission_denied_view.dart';
import 'package:smart_kitchen/features/scanning/presentation/ui/widgets/processing_indicator.dart';
import 'package:smart_kitchen/features/scanning/presentation/ui/widgets/scanner_overlay.dart';
import 'package:smart_kitchen/features/scanning/presentation/ui/widgets/scanning_controls.dart';

class ScanningPage extends StatefulWidget {
  const ScanningPage({super.key});

  @override
  State<ScanningPage> createState() => _ScanningPageState();
}

class _ScanningPageState extends State<ScanningPage> {
  late final MobileScannerController _cameraController;

  @override
  void initState() {
    super.initState();
    _cameraController = MobileScannerController(
      torchEnabled: false,
      detectionSpeed: DetectionSpeed.noDuplicates,
    );
    context.read<ScannerCubit>().initializeScanner();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  bool _isProcessingState(ScannerState state) => state is ScannerProcessing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocListener<InventoryCubit, InventoryState>(
          listener: (context, state) {
            if (state is InventoryError) {
              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Failed to add product: ${state.message}'),
                ),
              );
            }
          },
          child: BlocBuilder<ScannerCubit, ScannerState>(
            builder: (context, state) {
              return switch (state) {
                ScannerInitial() ||
                ScannerLoading() => const ProcessingIndicator(),
                ScannerReady() => Stack(
                  children: [
                    MobileScanner(
                      controller: _cameraController,
                      onDetect: (capture) async {
                        final barcodes = capture.barcodes;
                        if (barcodes.isEmpty) return;
                        final raw = barcodes.first.rawValue;
                        if (raw == null || raw.isEmpty) return;
                        final scannerCubit = context.read<ScannerCubit>();
                        final inventoryCubit = context.read<InventoryCubit>();
                        scannerCubit.startProcessing();
                        try {
                          await _cameraController.stop();
                          await inventoryCubit.addProductByBarcode(
                            barcode: raw,
                          );
                        } finally {
                          scannerCubit.finishProcessing(success: true);
                          if (mounted) {
                            await _cameraController.start();
                          }
                        }
                      },
                    ),
                    const ScannerOverlay(),
                    Positioned(
                      top: 18,
                      left: 8,
                      child: ScanningControls(
                        cameraController: _cameraController,
                      ),
                    ),
                    if (_isProcessingState(state)) const ProcessingIndicator(),
                  ],
                ),
                ScannerProcessing() => Stack(
                  children: [
                    MobileScanner(controller: _cameraController),
                    const ScannerOverlay(),
                    const ProcessingIndicator(),
                    Positioned(
                      top: 18,
                      left: 8,
                      child: ScanningControls(
                        cameraController: _cameraController,
                      ),
                    ),
                  ],
                ),
                ScannerPermissionDenied() => PermissionDeniedView(
                  onOpenSettings: () async {
                    await context
                        .read<ScannerCubit>()
                        .openAppSettingsAndCheck();
                  },
                ),
                ScannerFailure() => Center(child: Text(state.message)),
              };
            },
          ),
        ),
      ),
    );
  }
}
