import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smart_kitchen/features/scanning/presentation/cubit/scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  ScannerCubit() : super(ScannerInitial());

  Future<void> initializeScanner({bool requestIfNeeded = true}) async {
    emit(ScannerInitial());
    try {
      final status = await Permission.camera.status;
      if (status.isGranted) {
        emit(const ScannerReady(torchOn: false, isProcessing: false));
        return;
      }
      if (!requestIfNeeded) {
        emit(
          ScannerPermissionDenied(
            isPermanentlyDenied: status.isPermanentlyDenied,
          ),
        );
        return;
      }
      final newStatus = await Permission.camera.request();
      if (newStatus.isGranted) {
        emit(const ScannerReady(torchOn: false, isProcessing: false));
      } else {
        emit(
          ScannerPermissionDenied(
            isPermanentlyDenied: newStatus.isPermanentlyDenied,
          ),
        );
      }
    } catch (e) {
      emit(const ScannerFailure(message: 'Failed to initialize scanner.'));
    }
  }

  Future<void> requestPermission() async {
    await initializeScanner(requestIfNeeded: true);
  }

  Future<void> openAppSettingsAndCheck() async {
    final opened = await openAppSettings();
    if (!opened) {
      emit(const ScannerFailure(message: 'Could not open app settings.'));
      return;
    }
    await initializeScanner(requestIfNeeded: false);
  }

  void startProcessing() {
    final s = state;
    if (s is ScannerReady) {
      if (s.isProcessing) return;
      emit(s.copyWith(isProcessing: true));
    } else {
      emit(const ScannerReady(torchOn: false, isProcessing: true));
    }
  }

  void finishProcessing({bool success = true, String? message}) {
    if (!success) {
      emit(ScannerFailure(message: message ?? 'Processing failed'));
      return;
    }
    final s = state;
    if (s is ScannerReady) {
      emit(s.copyWith(isProcessing: false));
    } else {
      emit(const ScannerReady(torchOn: false, isProcessing: false));
    }
  }

  void setTorch({required bool torchOn}) {
    final s = state;
    if (s is ScannerReady) {
      emit(s.copyWith(torchOn: torchOn));
    } else if (s is ScannerLoading) {
      emit(ScannerReady(torchOn: torchOn, isProcessing: false));
    } else {
      emit(ScannerReady(torchOn: torchOn, isProcessing: false));
    }
  }

  void toggleTorch() {
    final s = state;
    if (s is ScannerReady) {
      emit(s.copyWith(torchOn: !s.torchOn));
    }
  }
}
