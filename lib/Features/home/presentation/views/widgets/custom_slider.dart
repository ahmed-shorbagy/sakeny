import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double currentSliderValue = 200; // Initialize with default value

  @override
  Widget build(BuildContext context) {
    return Slider(
      max: 2000,
      divisions: 10,
      activeColor: Theme.of(context).colorScheme.secondary,
      inactiveColor: Colors.grey,
      label: currentSliderValue.round().toString(),
      value: currentSliderValue, // Set value to currentSliderValue
      onChanged: (value) {
        setState(() {
          currentSliderValue = value; // Update currentSliderValue
        });
      },
    );
  }
}
