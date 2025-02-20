import 'package:go_router/go_router.dart';
import '../pages/home_page.dart';
import '../pages/character_swiper_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(),
    ),
    GoRoute(
      path: '/character-swiper',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return CharacterSwiperPage(
          characters: extra['characters'] as List<String>,
          flutterTts: extra['flutterTts'],
        );
      },
    ),
  ],
);