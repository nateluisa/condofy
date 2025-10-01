import 'package:go_router/go_router.dart';
import '../../modules/home/ui/home_page.dart';
import '../../modules/login/ui/login_page.dart';
import '../../modules/settings/ui/settings_page.dart';
import '../../modules/webview/ui/webview_page.dart';

final router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/webview',
      builder: (context, state) => const WebViewPage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
  ],
);