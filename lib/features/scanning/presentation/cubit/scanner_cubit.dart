import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smart_kitchen/features/scanning/presentation/cubit/scanner_state.dart';

class ScannerCubit extends Cubit<ScannerState> {
  ScannerCubit() : super(ScannerInitial());

  Future<void> initializeScanner() async {
    emit(ScannerInitial());
    try {
      final status = await Permission.camera.request();
      if (status.isGranted) {
        emit(ScannerReady());
      } else {
        emit(
          const ScannerFailure(
            message: 'Camera permission is required to scan products.',
          ),
        );
      }
    } catch (e) {
      emit(const ScannerFailure(message: 'Failed to initialize scanner.'));
    }
  }
}
