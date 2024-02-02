import 'package:flutter/material.dart';

import 'package:sakeny/Features/auth/presentation/views/widgets/sign_in_form.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const SingleChildScrollView(
        child: SignInForm(),
      ),
    );
  }
}
