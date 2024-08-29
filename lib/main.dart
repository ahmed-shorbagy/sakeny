import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sakeny/Features/home/data/Repos/home_repo.dart';
import 'package:sakeny/Features/home/presentation/manager/Language_manager/theme_manager.dart';
import 'package:sakeny/Features/home/presentation/manager/fetch_apartments_cubit.dart/fetch_apartments_cubit.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/custom_slider.dart';
import 'package:sakeny/core/errors/simple_bloc_observer.dart';
import 'package:sakeny/core/theme/theme_constants.dart';
import 'package:sakeny/core/theme/theme_manager.dart';
import 'package:sakeny/core/utils/App_router.dart';
import 'package:sakeny/core/utils/firebase_messaging_api.dart';
import 'package:sakeny/core/utils/service_locator.dart';
import 'package:sakeny/firebase_options.dart';
import 'package:sakeny/generated/l10n.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FireBaseAPi().initNotifications();

  setupServiceLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) {
            return ThemeProvider();
          },
        ),
        ChangeNotifierProvider<LanguageProvider>(
          create: (context) {
            return LanguageProvider();
          },
        ),
        ChangeNotifierProvider<SliderValueProvider>(
          create: (context) {
            return SliderValueProvider();
          },
        ),
      ],
      child: const Sakeny(),
    ),
  );

  Bloc.observer = SimpleBLocObserver();
}

class Sakeny extends StatelessWidget {
  const Sakeny({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return BlocProvider(
      create: (context) => FetchApartmentsCubit(getIt.get<HomeRepo>()),
      child: MaterialApp.router(
        locale: Locale(Provider.of<LanguageProvider>(context).local),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: lightTheme(),
        darkTheme: darkTheme(),
        themeMode: themeProvider.themeMode,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
