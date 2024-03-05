import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeny/Features/auth/data/repos/auth_repo.dart';
import 'package:sakeny/Features/auth/presentation/manager/Google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:sakeny/Features/auth/presentation/manager/New_user_cubit/new_user_cubit.dart';
import 'package:sakeny/Features/auth/presentation/manager/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:sakeny/Features/auth/presentation/manager/sign_up_with_emailandpassword_cubit/sign_up_with_email_passwod_cubit.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_button.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_google_button.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_shape_stack.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_underLine_textField.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/sign_up_bottom_text.dart';
import 'package:sakeny/core/models/user_cubit/user_cubit_cubit.dart';
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
  late String name;
  bool isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetUserDataCubit, GetUserDataState>(
      listener: (context, state) {
        if (state is GetUserDataSuccess) {
          GoRouter.of(context).pushReplacement(AppRouter.kMainView);
          UserCubit.user = state.user;
        } else if (state is GetUserDataFaluire) {
          snackBar(context, state.errMessage);
        }
      },
      child: Form(
        autovalidateMode: autovalidateMode,
        key: signupformkey,
        child: BlocListener<NewUserCubit, NewUserState>(
          listener: (context, state) {
            if (state is NewUserSuccess) {
              GoRouter.of(context).pushReplacement(AppRouter.kUserInfoView);
            } else if (state is NewUserFaluire) {
              snackBar(context, state.errMessage);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CustomShapeStack(
                label: "Sign up",
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: CustomUnderLineTextField(
                  label: "Name",
                  onChanged: (value) {
                    name = value;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: CustomUnderLineTextField(
                  label: "Email",
                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: CustomUnderLineTextField(
                  label: "Password",
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: CustomButton(
                  onPressed: isButtonDisabled
                      ? null
                      : () {
                          if (signupformkey.currentState!.validate()) {
                            signupformkey.currentState!.save();
                            BlocProvider.of<SignUpWithEmailPasswodCubit>(
                                    context)
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
                        isButtonDisabled = true;
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
                    listener: (context, state) async {
                      if (state is SignUpWithEmailPasswodSuccess) {
                        UserCubit.user.name = name;
                        UserCubit.user.email = email;
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.kUserInfoView);
                      } else if (state is SignUpWithEmailPasswodFaluire) {
                        isButtonDisabled = false;
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
              const SignUpBottomText()
            ],
          ),
        ),
      ),
    );
  }
}
