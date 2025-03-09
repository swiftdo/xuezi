import 'package:go_router/go_router.dart';
import '../pages/character_detail_page.dart';
import '../pages/home_page.dart';

// 这里假设 HomePage 等页面在对应的文件中已经正确导入
final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/detail',
      name: 'detail',
      builder: (context, state) {
        final extra = state.extra as Map<String, dynamic>;
        return CharacterDetailPage(
          title: extra['title'] as String,
          characters: (extra['characters'] as List<dynamic>).cast<String>(),
        );
      },
    ),
  ],
);
