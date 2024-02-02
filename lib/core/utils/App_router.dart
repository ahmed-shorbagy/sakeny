import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeny/Features/auth/data/repos/auth_repo.dart';
import 'package:sakeny/Features/auth/presentation/manager/Google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:sakeny/Features/auth/presentation/manager/sign_in_with_emailandpassword_cubit/sign_in_email_password_cubit.dart';
import 'package:sakeny/Features/auth/presentation/manager/sign_up_with_emailandpassword_cubit/sign_up_with_email_passwod_cubit.dart';
import 'package:sakeny/Features/auth/presentation/views/SignUp_view.dart';
import 'package:sakeny/Features/auth/presentation/views/User_info_view.dart';
import 'package:sakeny/Features/auth/presentation/views/signIn_view.dart';
import 'package:sakeny/Features/home/presentation/views/home_view.dart';
import 'package:sakeny/Features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String kHomeView = '/HomeView';
  static const String kSignInView = '/SignIn';
  static const String kSignUpView = '/SignUp';
  static const String kUserInfoView = '/UserInfoView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kSignInView,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignInEmailPasswordCubit(AuthRepo()),
          ),
          BlocProvider(
            create: (context) => GoogleSignInCubit(AuthRepo()),
          ),
        ],
        child: const SignInView(),
      ),
    ),
    GoRoute(
      path: kSignUpView,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignUpWithEmailPasswodCubit(AuthRepo()),
            child: const SignUpView(),
          ),
          BlocProvider(
            create: (context) => GoogleSignInCubit(AuthRepo()),
            child: const SignUpView(),
          ),
        ],
        child: const SignUpView(),
      ),
    ),
    GoRoute(
      path: kUserInfoView,
      builder: (context, state) => const UserInfoView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
  ]);
}
