import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeny/Features/auth/data/repos/auth_repo.dart';
import 'package:sakeny/Features/auth/presentation/manager/Google_sign_in_cubit/google_sign_in_cubit.dart';
import 'package:sakeny/Features/auth/presentation/manager/New_user_cubit/new_user_cubit.dart';
import 'package:sakeny/Features/auth/presentation/manager/change_password_cubit/change_password_cubit.dart';
import 'package:sakeny/Features/auth/presentation/manager/get_user_data_cubit/get_user_data_cubit.dart';
import 'package:sakeny/Features/auth/presentation/manager/sign_in_with_emailandpassword_cubit/sign_in_email_password_cubit.dart';
import 'package:sakeny/Features/auth/presentation/manager/sign_up_with_emailandpassword_cubit/sign_up_with_email_passwod_cubit.dart';
import 'package:sakeny/Features/auth/presentation/views/SignUp_view.dart';
import 'package:sakeny/Features/auth/presentation/views/User_info_view.dart';
import 'package:sakeny/Features/auth/presentation/views/sePassword_view.dart';
import 'package:sakeny/Features/auth/presentation/views/signIn_view.dart';
import 'package:sakeny/Features/home/presentation/views/home_view.dart';
import 'package:sakeny/Features/splash/presentation/views/splash_view.dart';
import 'package:sakeny/core/utils/service_locator.dart';

abstract class AppRouter {
  static const String kHomeView = '/HomeView';
  static const String kSignInView = '/SignIn';
  static const String kSignUpView = '/SignUp';
  static const String kUserInfoView = '/UserInfoView';
  static const String kChangePasswordView = '/ChangePasswordView';
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
            create: (context) =>
                SignInEmailPasswordCubit(getIt.get<AuthRepo>()),
          ),
          BlocProvider(
            create: (context) => GoogleSignInCubit(getIt.get<AuthRepo>()),
          ),
          BlocProvider(
            create: (context) => NewUserCubit(getIt.get<AuthRepo>()),
          ),
          BlocProvider(
            create: (context) => GetUserDataCubit(getIt.get<AuthRepo>()),
          ),
          BlocProvider(
            create: (context) => ChangePasswordCubit(),
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
            create: (context) =>
                SignUpWithEmailPasswodCubit(getIt.get<AuthRepo>()),
          ),
          BlocProvider(
            create: (context) => GoogleSignInCubit(getIt.get<AuthRepo>()),
          ),
          BlocProvider(
            create: (context) => NewUserCubit(getIt.get<AuthRepo>()),
          ),
          BlocProvider(
            create: (context) => GetUserDataCubit(getIt.get<AuthRepo>()),
          ),
        ],
        child: const SignUpView(),
      ),
    ),
    GoRoute(
      path: kUserInfoView,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NewUserCubit(getIt.get<AuthRepo>()),
          ),
          BlocProvider(
            create: (context) => GetUserDataCubit(getIt.get<AuthRepo>()),
          ),
        ],
        child: const UserInfoView(),
      ),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kChangePasswordView,
      builder: (context, state) => BlocProvider(
        create: (context) => ChangePasswordCubit(),
        child: const ChangePasswordView(),
      ),
    ),
  ]);
}
