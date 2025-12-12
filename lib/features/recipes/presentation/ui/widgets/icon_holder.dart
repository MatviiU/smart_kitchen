import 'package:flutter/material.dart';

class IconHolder extends StatelessWidget {
  const IconHolder({required this.icon, super.key});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      alignment: Alignment.center,
      child: Icon(icon),
    );
  }
}
