import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  final int value;

  const Dice({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFD0B3FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '$value',
        style: const TextStyle(
          color: Color(0xFF21172B),
          fontSize: 38,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
