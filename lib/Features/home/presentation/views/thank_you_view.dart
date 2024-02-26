import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_button.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/Custom_app_bar.dart';
import 'package:sakeny/core/utils/App_router.dart';

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
            const CustomAppBar(title: 'Thnak you'),
            Image.asset(
              'assets/pngs/Group 6476.png',
              scale: 0.7,
            ),
            Text(
              'Your Request has been sent successfully',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'you will be contacted soon',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Spacer(
              flex: 2,
            ),
            CustomButton(
                child: const Text('Continue to home'),
                onPressed: () {
                  GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
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
