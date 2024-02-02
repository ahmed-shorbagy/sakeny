import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeny/core/utils/App_router.dart';

class SignUpBottomText extends StatelessWidget {
  const SignUpBottomText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
