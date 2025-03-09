import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../pages/character_detail_page.dart';
import '../pages/learning_plan_list_page.dart';
import '../pages/learning_plan_page.dart';
import '../pages/learning_session_page.dart';
import '../pages/learning_statistics_page.dart';
import '../bloc/learning_statistics_bloc.dart';
import '../bloc/learning_plan_bloc.dart';
import '../bloc/learning_session_bloc.dart';
import '../../domain/repositories/learning_record_repository.dart';
import '../../injection.dart';
import '../../domain/repositories/learning_plan_repository.dart';

// 这里假设 HomePage 等页面在对应的文件中已经正确导入
final router = GoRouter(
  initialLocation: '/plans',
  routes: [
    GoRoute(
      path: '/plans',
      name: 'plans',
      builder: (context, state) => const LearningPlanListPage(),
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
    GoRoute(
      path: '/plan/create',
      name: 'plan_create',
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<LearningPlanBloc>(),
        child: const LearningPlanPage(),
      ),
    ),
    GoRoute(
      path: '/plan/edit/:id',
      name: 'plan_edit',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return FutureBuilder(
          future: getIt<LearningPlanRepository>().getPlanById(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            if (snapshot.hasError) {
              return Scaffold(
                body: Center(child: Text('错误：${snapshot.error}')),
              );
            }

            final plan = snapshot.data;
            if (plan == null) {
              return Scaffold(
                body: Center(child: Text('未找到学习计划')),
              );
            }

            return BlocProvider(
              create: (context) => getIt<LearningPlanBloc>(),
              child: LearningPlanPage(initialPlan: plan),
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/plan/:id/learn',
      name: 'learn',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return FutureBuilder(
          future: getIt<LearningPlanRepository>().getPlanById(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            if (snapshot.hasError) {
              return Scaffold(
                body: Center(child: Text('错误：${snapshot.error}')),
              );
            }

            final plan = snapshot.data;
            if (plan == null) {
              return const Scaffold(
                body: Center(child: Text('未找到学习计划')),
              );
            }

            return BlocProvider(
              create: (context) => getIt.get<LearningSessionBloc>(param1: plan),
              child: LearningSessionPage(plan: plan),
            );
          },
        );
      },
    ),
    GoRoute(
      path: '/plan/:id/statistics',
      builder: (context, state) {
        final planId = state.pathParameters['id']!;
        return BlocProvider(
          create: (context) =>
              LearningStatisticsBloc(getIt<LearningRecordRepository>())
                ..add(LearningStatisticsEvent.started(planId)),
          child: const LearningStatisticsPage(),
        );
      },
    ),
  ],
);
