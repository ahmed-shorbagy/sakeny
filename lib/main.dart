import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sakeny/Features/splash/presentation/views/splash_view.dart';
import 'package:sakeny/core/theme/theme_manager.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return ThemeProvider();
      },
      child: const Sakeny()));
}

class Sakeny extends StatelessWidget {
  const Sakeny({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
