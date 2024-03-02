import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sakeny/Features/home/data/Repos/home_repo.dart';
import 'package:sakeny/Features/home/presentation/manager/fetch_apartments_cubit.dart/fetch_apartments_cubit.dart';
import 'package:sakeny/core/errors/simple_bloc_observer.dart';
import 'package:sakeny/core/theme/theme_manager.dart';
import 'package:sakeny/core/utils/App_router.dart';
import 'package:sakeny/core/utils/firebase_messaging_api.dart';
import 'package:sakeny/core/utils/service_locator.dart';
import 'package:sakeny/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FireBaseAPi().initNotifications();

  setupServiceLocator();
  runApp(ChangeNotifierProvider(
      create: (context) {
        return ThemeProvider();
      },
      child: const Sakeny()));

  Bloc.observer = SimpleBLocObserver();
}

class Sakeny extends StatelessWidget {
  const Sakeny({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchApartmentsCubit(getIt.get<HomeRepo>()),
      child: MaterialApp.router(
        theme: Provider.of<ThemeProvider>(context).themeData,
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
