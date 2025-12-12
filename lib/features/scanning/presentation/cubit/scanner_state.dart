import 'package:equatable/equatable.dart';

sealed class ScannerState extends Equatable {
  const ScannerState();

  @override
  List<Object?> get props => [];
}

final class ScannerInitial extends ScannerState {}

final class ScannerLoading extends ScannerState {}

final class ScannerReady extends ScannerState {
  const ScannerReady({required this.torchOn, required this.isProcessing});

  final bool torchOn;
  final bool isProcessing;

  ScannerReady copyWith({bool? torchOn, bool? isProcessing}) {
    return ScannerReady(
      torchOn: torchOn ?? this.torchOn,
      isProcessing: isProcessing ?? this.isProcessing,
    );
  }

  @override
  List<Object?> get props => [torchOn, isProcessing];
}

final class ScannerProcessing extends ScannerState {}

final class ScannerPermissionDenied extends ScannerState {
  const ScannerPermissionDenied({required this.isPermanentlyDenied});

  final bool isPermanentlyDenied;

  @override
  List<Object?> get props => [isPermanentlyDenied];
}

final class ScannerFailure extends ScannerState {
  const ScannerFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
