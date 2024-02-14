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
bool isTriple = false;

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
                isSingle = !isSingle;
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
                isDouble = !isDouble;
              });
            },
            child:
                Text("Double", style: Theme.of(context).textTheme.bodyMedium!),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: OutlinedButton(
            style: ButtonStyle(
              side: MaterialStatePropertyAll<BorderSide>(
                BorderSide(
                    color: isTriple
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.transparent,
                    width: 2),
              ),
            ),
            onPressed: () {
              setState(() {
                isTriple = !isTriple;
              });
            },
            child:
                Text("Triple", style: Theme.of(context).textTheme.bodyMedium!),
          ),
        ),
      ],
    );
  }
}
