import 'package:flutter/material.dart';
import 'package:sakeny/core/utils/size_config.dart';

class CustomShapeStack extends StatelessWidget {
  const CustomShapeStack({
    super.key,
    required this.label,
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            "assets/pngs/Subtract.png",
            color: Theme.of(context).colorScheme.primary,
            scale: SizeConfig.defaultSize! * 0.01,
          ),
        ),
        Positioned(
          bottom: SizeConfig.screenhieght! * 0.04,
          left: 0,
          right: 0,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w800,
                ),
          ),
        ),
        Positioned(
          top: SizeConfig.defaultSize! * 10,
          left: 0,
          right: 0,
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                'assets/pngs/logo-no-background.png',
                scale: SizeConfig.defaultSize! * 0.6,
              ),
            ),
          ),
        )
      ],
    );
  }
}
