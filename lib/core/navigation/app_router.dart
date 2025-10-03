import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart' as lucide;
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/movies/presentation/pages/movies_page.dart';
import '../../features/movies/presentation/pages/movies_search_page.dart';
import '../../features/movies/presentation/pages/movie_details_page.dart';
import '../../features/movies/presentation/pages/favorites_page.dart';
import '../../features/movies/domain/entities/movie.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../presentation/pages/main_shell_page.dart';
import '../presentation/widgets/coming_soon_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'splash',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterPage();
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainShellPage(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              name: 'home',
              builder: (BuildContext context, GoRouterState state) {
                return const MoviesPage();
              },
              routes: [
                GoRoute(
                  path: 'search',
                  name: 'movies-search',
                  builder: (BuildContext context, GoRouterState state) {
                    return const MoviesSearchPage();
                  },
                ),
                GoRoute(
                  path: 'details',
                  name: 'movie-details',
                  builder: (BuildContext context, GoRouterState state) {
                    final movie = state.extra as Movie;
                    return MovieDetailsPage(movie: movie);
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/scanner',
              name: 'scanner',
              builder: (BuildContext context, GoRouterState state) {
                return const ComingSoonPage(
                  title: 'Scanner',
                  icon: lucide.LucideIcons.qrCode,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/chat',
              name: 'chat',
              builder: (BuildContext context, GoRouterState state) {
                return const ComingSoonPage(
                  title: 'AI Chat',
                  icon: lucide.LucideIcons.messageCircle,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/favorites',
              name: 'favorites',
              builder: (BuildContext context, GoRouterState state) {
                return const FavoritesPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              name: 'profile',
              builder: (BuildContext context, GoRouterState state) {
                return const ComingSoonPage(
                  title: 'Profile',
                  icon: lucide.LucideIcons.userCircle,
                );
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/movies',
      name: 'movies',
      builder: (BuildContext context, GoRouterState state) {
        return const MoviesPage();
      },
    ),
  ],
  errorBuilder: (context, state) => CupertinoPageScaffold(
    navigationBar: const CupertinoNavigationBar(middle: Text('Error')),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Page not found'),
          const SizedBox(height: 16),
          CupertinoButton(
            onPressed: () => context.go('/'),
            child: const Text('Go Home'),
          ),
        ],
      ),
    ),
  ),
);
