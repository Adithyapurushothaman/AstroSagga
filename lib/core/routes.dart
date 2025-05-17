import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/detail/widget/scaffold_with_bottom_nav_bar.dart';
import 'package:go_router/go_router.dart';
import '../feature/home/screen/home_screen.dart';
import '../feature/detail/screen/details_screen.dart';
import '../feature/chat/screen/chat_screen.dart';
import '../feature/shop/screen/shop_screen.dart';
import '../feature/profile/screen/profile_screen.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> _shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithBottomNavBar(child: child);
        },
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const HomeScreen(),
            ),
          ),
          GoRoute(
            path: '/chats',
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const ChatScreen(),
            ),
          ),
          GoRoute(
            path: '/shop',
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const ShopScreen(),
            ),
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) => NoTransitionPage<void>(
              key: state.pageKey,
              child: const ProfileScreen(),
            ),
          ),
        ],
      ),

      // Add astrologer details route as a separate top-level route
      GoRoute(
        path: '/astrologer/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return AstrologerDetailScreen(id: id);
        },
      ),
    ],
  );
}
