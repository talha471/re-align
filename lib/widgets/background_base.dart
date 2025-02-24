import 'package:flutter/material.dart';


class BaseScreen extends StatelessWidget {
  final Widget child;
  const BaseScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF37648C), // Top color
            Color(0xFFEAEDF6), // Bottom color
          ],
        ),
      ),
      child: child
    );
  }
}