import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeny/Features/auth/presentation/manager/Google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:sakeny/Features/auth/presentation/manager/sign_up_with_emailandpassword_cubit/sign_up_with_email_passwod_cubit.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_button.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_google_button.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_shape_stack.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_underLine_textField.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/sign_up_bottom_text.dart';
import 'package:sakeny/core/utils/App_router.dart';
import 'package:sakeny/core/utils/helper_methodes.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> signupformkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: signupformkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomShapeStack(
            label: "Sign up",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: CustomUnderLineTextField(
              label: "Email",
              onChanged: (value) {
                email = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: CustomUnderLineTextField(
              label: "Password",
              onChanged: (value) {
                password = value;
              },
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: CustomButton(
              onPressed: () {
                if (signupformkey.currentState!.validate()) {
                  signupformkey.currentState!.save();
                  BlocProvider.of<SignUpWithEmailPasswodCubit>(context)
                      .signUpWithEmailPassword(
                          email: email, password: password);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
              },
              child: BlocConsumer<SignUpWithEmailPasswodCubit,
                  SignUpWithEmailPasswodState>(
                builder: (context, state) {
                  if (state is SignUpWithEmailPasswodLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  } else {
                    return Text(
                      'Sign up',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                    );
                  }
                },
                listener: (context, state) {
                  if (state is SignUpWithEmailPasswodSuccess) {
                    GoRouter.of(context)
                        .pushReplacement(AppRouter.kUserInfoView);
                  } else if (state is SignUpWithEmailPasswodFaluire) {
                    snackBar(context, state.errMessage);
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Text('Or continue with',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 120, right: 120, top: 16, bottom: 16),
            child: CustomGoogleButton(
              onPressed: () {
                BlocProvider.of<GoogleSignInCubit>(context).signInWithGoogle();
              },
              child: BlocConsumer<GoogleSignInCubit, GoogleSignInState>(
                listener: (context, state) {
                  if (state is GoogleSignInSuccess) {
                    GoRouter.of(context)
                        .pushReplacement(AppRouter.kUserInfoView);
                  } else if (state is GoogleSignInFaluire) {
                    snackBar(context, state.errMessage);
                  }
                },
                builder: (context, state) {
                  if (state is GoogleSignInLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  } else {
                    return Image.asset(
                      'assets/pngs/Group5.png',
                      scale: 0.9,
                    );
                  }
                },
              ),
            ),
          ),
          const SignUpBottomText()
        ],
      ),
    );
  }
}
