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
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: '/friend',
      builder: (context, state) => FriendPage(
        friend: state.extra as Friend,
      ),
    ),
  ],
);
