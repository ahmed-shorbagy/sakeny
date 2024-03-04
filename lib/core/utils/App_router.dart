import 'package:flutter/material.dart';
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
import 'package:sakeny/Features/favorites/data/Repos/favorites_repo.dart';
import 'package:sakeny/Features/favorites/peresentation/manager/add_favorite/add_favorite_cubit.dart';
import 'package:sakeny/Features/favorites/peresentation/manager/fetch_favorites/fetch_favorites_cubit.dart';
import 'package:sakeny/Features/favorites/peresentation/manager/remove_favorite/remove_favorite_cubit.dart';
import 'package:sakeny/Features/favorites/peresentation/views/favorites_view.dart';
import 'package:sakeny/Features/home/data/Models/apartment_model.dart';
import 'package:sakeny/Features/home/data/Repos/home_repo.dart';
import 'package:sakeny/Features/home/presentation/manager/fetch_apartments_cubit.dart/fetch_apartments_cubit.dart';
import 'package:sakeny/Features/home/presentation/manager/request_cubit/requests_cubit.dart';
import 'package:sakeny/Features/home/presentation/views/apatment_details_view.dart';
import 'package:sakeny/Features/home/presentation/views/home_view.dart';
import 'package:sakeny/Features/home/presentation/views/profile_view.dart';
import 'package:sakeny/Features/home/presentation/views/thank_you_view.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/main_view.dart';
import 'package:sakeny/Features/splash/presentation/views/splash_view.dart';
import 'package:sakeny/core/utils/service_locator.dart';

abstract class AppRouter {
  static const String kMainView = '/mainView';
  static const String kHomeView = '/HomeView';
  static const String kSignInView = '/SignIn';
  static const String kSignUpView = '/SignUp';
  static const String kUserInfoView = '/UserInfoView';
  static const String kChangePasswordView = '/ChangePasswordView';
  static const String kAddNewAppartmentView = '/AddNewAppartmentView';
  static const String kAppartmentdetailsView = '/AppartmentdetailsView';
  static const String kThnakYouView = '/ThankYouView';
  static const String kFavoritesView = '/favoritesView';
  static const String kProfileView = '/profileView';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kMainView,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                FetchFavoritesCubit(getIt.get<FavoritesRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                AddFavoriteCubit(getIt.get<FavoritesRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                RemoveFavoriteCubit(getIt.get<FavoritesRepository>()),
          ),
        ],
        child: const MainView(),
      ),
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
        pageBuilder: (context, state) {
          return basicTransition(
              child: MultiBlocProvider(
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
          ));
        }),
    GoRoute(
        path: kUserInfoView,
        pageBuilder: (context, state) {
          return basicTransition(
              child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => NewUserCubit(getIt.get<AuthRepo>()),
              ),
              BlocProvider(
                create: (context) => GetUserDataCubit(getIt.get<AuthRepo>()),
              ),
            ],
            child: const UserInfoView(),
          ));
        }),
    GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) {
          return stylishSideTransition(
              child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    FetchApartmentsCubit(getIt.get<HomeRepo>()),
              ),
              BlocProvider(
                create: (context) =>
                    AddFavoriteCubit(getIt.get<FavoritesRepository>()),
              ),
              BlocProvider(
                create: (context) =>
                    RemoveFavoriteCubit(getIt.get<FavoritesRepository>()),
              ),
            ],
            child: const HomeView(),
          ));
        }),
    GoRoute(
      path: kChangePasswordView,
      builder: (context, state) => BlocProvider(
        create: (context) => ChangePasswordCubit(),
        child: const ChangePasswordView(),
      ),
    ),
    GoRoute(
      path: kAddNewAppartmentView,
      pageBuilder: (context, state) {
        return basicTransition(
            child: ApartmentDetailsView(
          apartment: state.extra as ApartmentModel,
        ));
      },
    ),
    GoRoute(
      path: kAppartmentdetailsView,
      pageBuilder: (context, state) {
        return basicTransition(
            child: BlocProvider(
          create: (context) => RequestsCubit(getIt.get<HomeRepo>()),
          child: ApartmentDetailsView(apartment: state.extra as ApartmentModel),
        ));
      },
    ),
    GoRoute(
      path: kThnakYouView,
      pageBuilder: (context, state) {
        return basicTransition(child: const ThankYouView());
      },
    ),
    GoRoute(
        path: kFavoritesView,
        pageBuilder: (context, state) {
          return stylishSideTransition(
              child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    FetchFavoritesCubit(getIt.get<FavoritesRepository>()),
              ),
              BlocProvider(
                create: (context) =>
                    AddFavoriteCubit(getIt.get<FavoritesRepository>()),
              ),
              BlocProvider(
                create: (context) =>
                    RemoveFavoriteCubit(getIt.get<FavoritesRepository>()),
              ),
            ],
            child: const FavoritesView(),
          ));
        }),
    GoRoute(
        path: kProfileView,
        pageBuilder: (context, state) {
          return stylishSideTransition(child: const ProfileView());
        }),
  ]);
}

CustomTransitionPage stylishSideTransition({required child}) {
  return CustomTransitionPage(
    transitionDuration: const Duration(milliseconds: 300),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
            .animate(animation),
        child: child,
      );
    },
  );
}

CustomTransitionPage basicTransition({required child}) {
  return CustomTransitionPage(
    transitionDuration: const Duration(milliseconds: 400),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}
