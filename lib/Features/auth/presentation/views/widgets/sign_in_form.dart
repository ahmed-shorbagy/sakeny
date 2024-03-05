import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeny/Features/auth/data/repos/auth_repo.dart';
import 'package:sakeny/Features/auth/presentation/manager/Google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:sakeny/Features/auth/presentation/manager/change_password_cubit/change_password_cubit.dart';
import 'package:sakeny/Features/auth/presentation/manager/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:sakeny/Features/auth/presentation/manager/sign_in_with_emailandpassword_cubit/sign_in_email_password_cubit.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_button.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_google_button.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_shape_stack.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_underLine_textField.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/sign_in_bottom_text.dart';
import 'package:sakeny/core/models/user_cubit/user_cubit_cubit.dart';
import 'package:sakeny/core/utils/App_router.dart';
import 'package:sakeny/core/utils/helper_methodes.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email;
  late String password;
  bool isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formkey,
      child: BlocListener<GetUserDataCubit, GetUserDataState>(
        listener: (context, state) {
          if (state is GetUserDataSuccess) {
            UserCubit.user = state.user;
            GoRouter.of(context).pushReplacement(AppRouter.kMainView);
          } else if (state is GetUserDataFaluire) {
            snackBar(context, state.errMessage);
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomShapeStack(
              label: "Login",
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
                  child: BlocListener<ChangePasswordCubit, ChangePasswordState>(
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
                    child: Text(
                      'Forgot?',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.outline,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      await BlocProvider.of<ChangePasswordCubit>(context)
                          .sendPasswordReset(email: email);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: CustomButton(
                onPressed: isButtonDisabled
                    ? null
                    : () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          BlocProvider.of<SignInEmailPasswordCubit>(context)
                              .signInWithEmailPassword(
                                  email: email, password: password);
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                        }
                      },
                child: BlocConsumer<SignInEmailPasswordCubit,
                    SignInEmailPasswordState>(
                  listener: (context, state) {
                    if (state is SignInEmailPasswordSuccess) {
                      BlocProvider.of<GetUserDataCubit>(context)
                          .getUserData(uId: auth.currentUser?.uid ?? '');
                    } else if (state is SignInEmailPasswordFaluire) {
                      isButtonDisabled = false;
                      snackBar(context, state.errMessage);
                    }
                  },
                  builder: (context, state) {
                    if (state is SignInEmailPasswordLoading) {
                      isButtonDisabled = true;
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    } else {
                      return Text(
                        'Log in',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: Colors.white),
                      );
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
                onPressed: isButtonDisabled
                    ? null
                    : () {
                        BlocProvider.of<GoogleSignInCubit>(context)
                            .signInWithGoogle();
                      },
                child: BlocConsumer<GoogleSignInCubit, GoogleSignInState>(
                  listener: (context, state) async {
                    if (state is GoogleSignInSuccess) {
                      final User? firebaseUser = auth.currentUser;
                      if (firebaseUser != null) {
                        DocumentSnapshot userDoc = await firestore
                            .collection('Users')
                            .doc(firebaseUser.uid)
                            .get();
                        if (!userDoc.exists) {
                          GoRouter.of(context)
                              .pushReplacement(AppRouter.kUserInfoView);
                          // If user profile doesn't exist, create one
                        } else {
                          await BlocProvider.of<GetUserDataCubit>(context)
                              .getUserData(uId: auth.currentUser?.uid ?? '');
                        }
                      }
                    } else if (state is GoogleSignInFaluire) {
                      isButtonDisabled = false;
                      snackBar(context, state.errMessage);
                    }
                  },
                  builder: (context, state) {
                    if (state is GoogleSignInLoading) {
                      isButtonDisabled = true;
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
            const SignInBottomText(),
          ],
        ),
      ),
    );
  }
}
