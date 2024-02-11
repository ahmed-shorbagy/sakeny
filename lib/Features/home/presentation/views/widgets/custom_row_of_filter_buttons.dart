import 'package:flutter/material.dart';

class RowOfFilterButtons extends StatefulWidget {
  const RowOfFilterButtons({
    super.key,
  });

  @override
  State<RowOfFilterButtons> createState() => _RowOfFilterButtonsState();
}

bool isSingle = false;
bool isDouble = false;

class _RowOfFilterButtonsState extends State<RowOfFilterButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: OutlinedButton(
            style: ButtonStyle(
              side: MaterialStatePropertyAll<BorderSide>(
                BorderSide(
                    color: isSingle
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.transparent,
                    width: 2),
              ),
            ),
            onPressed: () {
              setState(() {
                isSingle = true;
                isDouble = false;
              });
            },
            child:
                Text("Single", style: Theme.of(context).textTheme.bodyLarge!),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: OutlinedButton(
            style: ButtonStyle(
              side: MaterialStatePropertyAll<BorderSide>(
                BorderSide(
                    color: isDouble
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.transparent,
                    width: 2),
              ),
            ),
            onPressed: () {
              setState(() {
                isSingle = false;
                isDouble = true;
              });
            },
            child:
                Text("Double", style: Theme.of(context).textTheme.bodyMedium!),
          ),
        ),
      ],
    );
  }
}
