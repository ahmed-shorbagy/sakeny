import 'package:go_router/go_router.dart';
import 'package:sakeny/Features/auth/presentation/views/signIn_view.dart';
import 'package:sakeny/Features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String kHomeView = '/HomeView';
  static const String kSignInView = '/SignIng';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kSignInView,
      builder: (context, state) => const SignInView(),
    ),
  ]);
}
