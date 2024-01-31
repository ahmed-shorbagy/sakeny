import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_button.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_shape_stack.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_underLine_textField.dart';
import 'package:sakeny/core/utils/App_router.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomShapeStack(
              label: "Sign up",
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: CustomUnderLineTextField(
                label: "Email",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: CustomUnderLineTextField(
                label: "Password",
                suffixIcon: GestureDetector(
                  child: Text(
                    'Forgot?',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.outline,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: CustomButton(
                label: 'Sign up',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Text('Already have account?',
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pushReplacement(AppRouter.kSignInView);
                  },
                  child: Text(
                    'Sign in',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
