import 'package:equatable/equatable.dart';

sealed class ScannerState extends Equatable {
  const ScannerState();

  @override
  List<Object> get props => [];
}

final class ScannerInitial extends ScannerState {}

final class ScannerLoading extends ScannerState {}

final class ScannerReady extends ScannerState {}

final class ScannerFailure extends ScannerState {
  const ScannerFailure({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}
