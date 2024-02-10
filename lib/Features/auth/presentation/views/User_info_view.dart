import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeny/Features/auth/data/repos/auth_repo.dart';
import 'package:sakeny/Features/auth/presentation/manager/New_user_cubit/new_user_cubit.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_button.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_phoneField.dart';
import 'package:sakeny/core/models/user_cubit/user_cubit_cubit.dart';
import 'package:sakeny/core/utils/App_router.dart';
import 'package:sakeny/core/utils/helper_methodes.dart';
import 'package:sakeny/core/utils/size_config.dart';

class UserInfoView extends StatefulWidget {
  const UserInfoView({super.key});

  @override
  State<UserInfoView> createState() => _UserInfoViewState();
}

bool isPhoneNumberEntered = false;
bool isButtonSelected = false;
AutovalidateMode autovalidateMode = AutovalidateMode.always;

class _UserInfoViewState extends State<UserInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<NewUserCubit, NewUserState>(
        listener: (context, state) {
          if (state is NewUserSuccess) {
            GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(
              flex: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomPhoneField(
                  autoValidateMode: autovalidateMode,
                  onChanged: (value) {
                    setState(() {
                      UserCubit.user.phoneNumber = value?.international ?? '';
                      isPhoneNumberEntered =
                          value?.international.isNotEmpty ?? false;
                    });
                  }),
            ),
            const Spacer(
              flex: 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'are you a student or a property owner?',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            CustomRowOfButtons(
              onButtonsSelected: (selected) {
                setState(() {
                  isButtonSelected = selected;
                });
              },
            ),
            const Spacer(
              flex: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomButton(
                  onPressed: isPhoneNumberEntered && isButtonSelected
                      ? () async {
                          await BlocProvider.of<NewUserCubit>(context)
                              .addUserToFireStore(
                                  user: UserCubit.user,
                                  uid: auth.currentUser?.uid ?? '');
                        }
                      : () {
                          snackBar(context,
                              'Please Enter your phone Number and Select account type to continue');
                        },
                  child: const Text(
                    'Continue',
                  )),
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}

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
                    color: isStudent
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.transparent),
                borderRadius: BorderRadius.circular(6)),
            child: CustomButton(
                onPressed: () {
                  UserCubit.user.isStudent = true;
                  setState(() {
                    isOwner = false;
                    isStudent = true;
                  });
                  widget.onButtonsSelected(true);
                },
                child: Column(
                  children: [
                    SizedBox(
                      width: SizeConfig.screenwidth! * 0.3,
                      child: const Text(
                        'Iam a colloge  student',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                    const Text(
                      '👨‍🎓',
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
                    color: isOwner
                        ? Theme.of(context).colorScheme.secondary
                        : Colors.transparent),
                borderRadius: BorderRadius.circular(6)),
            child: CustomButton(
                onPressed: () {
                  UserCubit.user.isStudent = false;
                  setState(() {
                    isOwner = true;
                    isStudent = false;
                  });
                  widget.onButtonsSelected(true);
                },
                child: Column(
                  children: [
                    SizedBox(
                      width: SizeConfig.screenwidth! * 0.3,
                      child: const Text(
                        'Iam a property owner',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    ),
                    const Text(
                      '🏘️',
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
