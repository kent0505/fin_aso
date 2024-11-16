import 'package:go_router/go_router.dart';

import '../models/friend.dart';
import '../pages/friend_page.dart';
import '../pages/home_page.dart';
import '../pages/onboard_page.dart';
import '../pages/profile_page.dart';
import '../pages/splash_page.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashPage();
        }),
    GoRoute(
        path: '/onboard',
        builder: (context, state) {
          return const OnboardPage();
        }),
    GoRoute(
        path: '/home',
        builder: (context, state) {
          return const HomePage();
        }),
    GoRoute(
        path: '/profile',
        builder: (context, state) {
          return const ProfilePage();
        }),
    GoRoute(
        path: '/friend',
        builder: (context, state) {
          return FriendPage(friend: state.extra as Friend);
        }),
  ],
);
