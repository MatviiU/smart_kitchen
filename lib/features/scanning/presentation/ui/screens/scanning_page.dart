import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
  bool _isHandlingDetection = false;
  bool _showDetectionFeedback = false;
  bool _awaitingScanResult = false;

  @override
  void initState() {
    super.initState();
    _cameraController = MobileScannerController(
      torchEnabled: false,
      detectionSpeed: DetectionSpeed.normal,
      detectionTimeoutMs: 800,
    );
    context.read<ScannerCubit>().initializeScanner();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  bool _isProcessingState(ScannerState state) =>
      state is ScannerReady && state.isProcessing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: BlocListener<InventoryCubit, InventoryState>(
          listener: (context, state) {
            if (state is InventoryLoaded && _awaitingScanResult) {
              _awaitingScanResult = false;
              if (context.canPop()) {
                context.pop();
              }
              return;
            }
            if (state is InventoryError) {
              _awaitingScanResult = false;
              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Failed to add product: ${state.message}'),
                ),
              );
            }
            if (state is InventoryProductNotFound) {
              _awaitingScanResult = false;
              if (!mounted) return;
              final messenger = ScaffoldMessenger.maybeOf(context);
              if (context.canPop()) {
                context.pop();
              }
              messenger?.showSnackBar(
                const SnackBar(
                  content: Text(
                    'Product not found. Please add it manually.',
                  ),
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
                        if (_isHandlingDetection) return;
                        final barcodes = capture.barcodes;
                        if (barcodes.isEmpty) return;
                        final raw = barcodes.first.rawValue;
                        if (raw == null || raw.isEmpty) return;
                        _isHandlingDetection = true;
                        if (mounted) {
                          setState(() => _showDetectionFeedback = true);
                        }
                        await Future<void>.delayed(
                          const Duration(milliseconds: 300),
                        );
                        final scannerCubit = context.read<ScannerCubit>();
                        final inventoryCubit = context.read<InventoryCubit>();
                        scannerCubit.startProcessing();
                        _awaitingScanResult = true;
                        try {
                          await _cameraController.stop();
                          await inventoryCubit.addProductByBarcode(
                            barcode: raw,
                          );
                        } finally {
                          scannerCubit.finishProcessing(success: true);
                          if (mounted) {
                            setState(() => _showDetectionFeedback = false);
                          }
                          if (mounted) {
                            await _cameraController.start();
                          }
                          _isHandlingDetection = false;
                        }
                      },
                    ),
                    ScannerOverlay(isDetected: _showDetectionFeedback),
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
                    ScannerOverlay(isDetected: _showDetectionFeedback),
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
