import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeny/core/utils/App_router.dart';
import 'package:sakeny/generated/l10n.dart';

class SignInBottomText extends StatelessWidget {
  const SignInBottomText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(S.of(context).dontHaveAccount,
              style: Theme.of(context).textTheme.bodyMedium),
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pushReplacement(AppRouter.kSignUpView);
          },
          child: Text(
            S.of(context).createAccount,
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
