import 'dart:math';
import 'package:flutter/material.dart';
import 'dice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Play Dice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFBFA0F4),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF151316),
        appBarTheme: const AppBarTheme(
          backgroundColor: const Color(0xFF70558F),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        useMaterial3: true,
      ),
      home: const DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  int dice1 = 1;
  int dice2 = 1;
  int total = 2;
  String imagePath = 'assets/sad.png';
  final Random random = Random();

  void rollDice() {
    setState(() {
      dice1 = random.nextInt(6) + 1;
      dice2 = random.nextInt(6) + 1;
      total = dice1 + dice2;
      imagePath = total >= 10 ? 'assets/happy.png' : 'assets/sad.png';
    });
  }

  void resetDice() {
    setState(() {
      dice1 = 1;
      dice2 = 1;
      total = 2;
      imagePath = 'assets/sad.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool won = total >= 10;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.casino),
        title: const Text('Play Dice'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 4),
              Text(
                'Total is $total',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 20),
              Expanded(
                flex: 5,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  width: double.infinity,
                ),
              ),
              Text(
                won ? 'You Win' : 'You Lose',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: won ? const Color(0xFF9FE6A0) : const Color(0xFFFF8A80),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Dice(value: dice1),
                  Dice(value: dice2),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: rollDice,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF44336),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text('roll'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: resetDice,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF44336),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: const Text('reset'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
