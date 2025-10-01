import 'package:condofy/core/services/local_storage/local_storage_service.dart';
import 'package:condofy/core/services/local_storage/shared_preferences_service.dart';
import 'package:condofy/modules/login/ui/login_store.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/services/local_storage/settings_store.dart';
import '../modules/home/ui/home_store.dart';
import '../modules/webview/ui/webview_store.dart';

class AppModule {
  static final getIt = GetIt.I;

  static Future<void> setupDependencies() async {

    final prefs = await SharedPreferences.getInstance();
    getIt.registerSingleton<SharedPreferences>(prefs);

    getIt.registerLazySingleton<ILocalStorageService>(
          () => SharedPreferencesService(getIt<SharedPreferences>()),
    );

    getIt.registerFactory<LoginStore>(
          () => LoginStore(getIt<ILocalStorageService>()),
    );

    getIt.registerFactory<HomeStore>(
          () => HomeStore(getIt<ILocalStorageService>()),
    );

    getIt.registerLazySingleton<SettingsStore>(
          () => SettingsStore(getIt<ILocalStorageService>()),
    );

    getIt.registerFactory<WebViewStore>(() => WebViewStore());
  }
}