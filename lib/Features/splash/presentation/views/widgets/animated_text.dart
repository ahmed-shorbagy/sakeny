import 'package:flutter/material.dart';
import 'package:sakeny/Features/splash/presentation/views/splash_view.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Text(
            'Your Second Home, Your New Life',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        );
      },
      animation: slidingAnimation,
    );
  }
}
