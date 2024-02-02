import 'package:flutter/material.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/sign_up_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const SingleChildScrollView(
        child: SignUpForm(),
      ),
    );
  }
}
