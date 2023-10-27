import 'package:go_router/go_router.dart';
import 'package:skywatch/pages/city_selector/city_selector_view.dart';
import 'package:skywatch/pages/welcome/welcome_view.dart';
import 'package:skywatch/route/routes.dart';

class SkyWatchRouter {
  static final router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const WelcomeView();
        },
        routes: <RouteBase>[
          GoRoute(
            path: Routes.welcome.name,
            builder: (context, state) {
              return const WelcomeView();
            },
          ),
          GoRoute(
            path: Routes.city.name,
            builder: (context, state) {
              return const CitySelectorView();
            },
          ),
          GoRoute(
            path: Routes.videos.name,
            builder: (context, state) {
              return const CitySelectorView(); // change
            },
          ),
          GoRoute(
            path: Routes.weather.name,
            builder: (context, state) {
              return const CitySelectorView(); // change
            },
          ),
          GoRoute(
            path: Routes.profile.name,
            builder: (context, state) {
              return const CitySelectorView(); // change
            },
          ),
        ],
      ),
    ],
  );
}
