import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_button.dart';
import 'package:sakeny/Features/home/presentation/manager/delete_acount_cubit/delete_password_cubit.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/Custom_app_bar.dart';
import 'package:sakeny/core/utils/App_router.dart';
import 'package:sakeny/core/utils/helper_methodes.dart';
import 'package:sakeny/generated/l10n.dart';

class DeleteAccountView extends StatelessWidget {
  const DeleteAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocListener<DeletePasswordCubit, DeletePasswordState>(
          listener: (context, state) {
            if (state is DeletePasswordSuccess) {
              GoRouter.of(context).pushReplacement(AppRouter.kSignUpView);
            }
            if (state is DeletePasswordFaluire) {
              snackBar(context, state.errMessage);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 30),
                child: CustomAppBar(
                  title: S.of(context).DeleteAccount,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  S.of(context).AreYouSure,
                  style: Theme.of(context).textTheme.bodyLarge!,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                onPressed: () async {
                  await BlocProvider.of<DeletePasswordCubit>(context)
                      .deleteAccount();
                },
                child: Text(
                  S.of(context).Delete,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
