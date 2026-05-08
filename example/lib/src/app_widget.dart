
import 'package:example/src/widgets/home.dart';
import 'package:flutter/material.dart';

class ElectricShapesExampleApp extends StatelessWidget {
  const ElectricShapesExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Electric Shapes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0A6E5A),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F1E8),
        useMaterial3: true,
      ),
      home: const ExampleHomePage(),
    );
  }
}