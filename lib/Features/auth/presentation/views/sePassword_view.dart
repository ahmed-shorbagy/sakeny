import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeny/Features/auth/presentation/manager/change_password_cubit/change_password_cubit.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_button.dart';

import 'package:sakeny/Features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:sakeny/core/models/user_cubit/user_cubit_cubit.dart';
import 'package:sakeny/core/utils/App_router.dart';
import 'package:sakeny/core/utils/helper_methodes.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({
    super.key,
  });

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

bool isVisible = false;

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
TextEditingController _passwordController = TextEditingController();
TextEditingController _confirmPasswordController = TextEditingController();
bool passwordsMatch = true; // Initially assume passwords match

class _ChangePasswordViewState extends State<ChangePasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Set Password',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 76),
              child: Text(
                'Set Your Password',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: CustomTextField(
                  obscuretext: !isVisible,
                  suffixIcon: isVisible
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: const Icon(
                            Icons.visibility,
                            color: Colors.grey,
                          ))
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          )),
                  onChanged: (value) {
                    _passwordController.text = value;
                  },
                  hintText: 'Enter your password'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: CustomTextField(
                  obscuretext: !isVisible,
                  suffixIcon: isVisible
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: const Icon(
                            Icons.visibility,
                            color: Colors.grey,
                          ))
                      : IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          icon: const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          )),
                  onChanged: (value) {
                    _confirmPasswordController.text = value;
                  },
                  hintText: 'Confirm your password'),
            ),
            if (!passwordsMatch)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  'Passwords do not match',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            const Spacer(
              flex: 3,
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Spacer(
                  flex: 1,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: CustomButton(
                child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                  builder: (context, state) {
                    if (state is ChangePasswordLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    } else {
                      return const Text('Set Password');
                    }
                  },
                  listener: (context, state) {
                    if (state is ChangePasswordSuccess) {
                      snackBar(context,
                          'password reset email has been send to you please check your inbox and sign in again');
                      GoRouter.of(context)
                          .pushReplacement(AppRouter.kSignInView);
                    } else if (state is ChangePasswordFaluire) {
                      snackBar(context, state.errMessage);
                    }
                  },
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Password validation logic
                    if (_passwordController.text !=
                        _confirmPasswordController.text) {
                      setState(() {
                        passwordsMatch = false;
                      });
                    } else {
                      setState(() {
                        passwordsMatch = true;
                      });
                    }

                    await BlocProvider.of<ChangePasswordCubit>(context)
                        .sendPasswordReset(email: UserCubit.user.email);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
