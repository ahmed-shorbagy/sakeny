import 'package:get_it/get_it.dart';
import 'package:sakeny/Features/auth/data/repos/auth_repo.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<AuthRepo>(
    AuthRepo(),
  );
}
