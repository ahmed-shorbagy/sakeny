import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_button.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/Custom_app_bar.dart';
import 'package:sakeny/core/utils/App_router.dart';
import 'package:sakeny/generated/l10n.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomAppBar(title: S.of(context).thankYouForRegistering),
            Image.asset(
              'assets/pngs/Group 6476.png',
              scale: 0.7,
            ),
            Text(
              S.of(context).YourRequesthasbeensentsuccessfully,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              S.of(context).youwillbecontactedsoon,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Spacer(
              flex: 2,
            ),
            CustomButton(
                child: Text(S.of(context).ContinueToHome),
                onPressed: () {
                  GoRouter.of(context).pop();
                }),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
