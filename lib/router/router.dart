import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../pages/home_page.dart';
import '../pages/character_swiper_page.dart';

// 这里假设 HomePage 等页面在对应的文件中已经正确导入
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomePage(
          shuffledCharacters: [],
          firstShuffledCharacters: [],
          flutterTts: FlutterTts(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'character-swiper',
          builder: (BuildContext context, GoRouterState state) {
            final extra = state.extra as Map<String, dynamic>;
            return CharacterSwiperPage(
              characters: extra['characters'] as List<String>,
              flutterTts: extra['flutterTts'] as FlutterTts,
              onCharacterLearned:
                  extra['onCharacterLearned'] as Function(String),
            );
          },
        ),
      ],
    ),
  ],
);
