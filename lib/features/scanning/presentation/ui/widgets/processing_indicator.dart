import 'package:flutter/material.dart';

class ProcessingIndicator extends StatelessWidget {
  const ProcessingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.black45,
      child: Center(
        child: SizedBox(
          width: 120,
          height: 120,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
