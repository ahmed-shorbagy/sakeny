import 'package:flutter/material.dart';
import 'package:sakeny/Features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const Sakeny());
}

class Sakeny extends StatelessWidget {
  const Sakeny({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashView(),
    );
  }
}
