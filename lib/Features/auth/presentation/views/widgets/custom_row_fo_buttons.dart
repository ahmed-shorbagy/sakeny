import 'package:flutter/material.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_button.dart';
import 'package:sakeny/core/models/user_cubit/user_cubit_cubit.dart';
import 'package:sakeny/core/utils/size_config.dart';

class CustomRowOfButtons extends StatefulWidget {
  const CustomRowOfButtons({
    super.key,
    required this.onButtonsSelected,
  });
  final Function(bool) onButtonsSelected;
  @override
  State<CustomRowOfButtons> createState() => _CustomRowOfButtonsState();
}

bool isStudent = false;
bool isOwner = false;

class _CustomRowOfButtonsState extends State<CustomRowOfButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: isStudent
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.transparent),
                borderRadius: BorderRadius.circular(6)),
            child: CustomButton(
                onPressed: () {
                  UserCubit.user.isMail = true;
                  setState(() {
                    isOwner = false;
                    isStudent = true;
                  });
                  widget.onButtonsSelected(true);
                },
                child: Column(
                  children: [
                    SizedBox(
                      width: SizeConfig.screenwidth! * 0.2,
                      child: const Text(
                        'Male',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                    const Text(
                      '♂️',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: isOwner
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.transparent),
                borderRadius: BorderRadius.circular(6)),
            child: CustomButton(
                onPressed: () {
                  UserCubit.user.isMail = false;
                  setState(() {
                    isOwner = true;
                    isStudent = false;
                  });
                  widget.onButtonsSelected(true);
                },
                child: Column(
                  children: [
                    SizedBox(
                      width: SizeConfig.screenwidth! * 0.2,
                      child: const Text(
                        'Female',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                    const Text(
                      '♀️',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                )),
          ),
        )
      ],
    );
  }
}
