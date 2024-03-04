import 'package:get_it/get_it.dart';
import 'package:sakeny/Features/auth/data/repos/auth_repo.dart';
import 'package:sakeny/Features/favorites/data/Repos/favorites_repo.dart';
import 'package:sakeny/Features/home/data/Repos/home_repo.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<AuthRepo>(
    AuthRepo(),
  );

  getIt.registerSingleton<HomeRepo>(
    HomeRepo(),
  );
  getIt.registerSingleton<FavoritesRepository>(
    FavoritesRepository(),
  );
}
