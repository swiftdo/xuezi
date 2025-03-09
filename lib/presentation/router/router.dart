import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';
import '../pages/learning_plan_list_page.dart';
import '../pages/learning_plan_page.dart';
import '../pages/learning_session_page.dart';
import '../pages/review_page.dart';
import '../pages/learning_statistics_page.dart';
import '../../domain/repositories/learning_plan_repository.dart';
import '../../domain/entities/learning_plan.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    // 学习计划列表页面（首页）
    GoRoute(
      path: '/',
      builder: (context, state) => const LearningPlanListPage(),
    ),
    // 创建新学习计划
    GoRoute(
      path: '/plan/new',
      builder: (context, state) => const LearningPlanPage(),
    ),
    // 编辑学习计划
    GoRoute(
      path: '/plan/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'];
        if (id == null) {
          return const LearningPlanListPage();
        }
        return FutureBuilder<LearningPlan?>(
          future: GetIt.I<LearningPlanRepository>().getPlanById(id),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
            final plan = snapshot.data;
            if (plan == null) {
              return const LearningPlanListPage();
            }
            return LearningPlanPage(initialPlan: plan);
          },
        );
      },
    ),
    // 学习会话页面
    GoRoute(
      path: '/learn/:planId',
      builder: (context, state) {
        final planId = state.pathParameters['planId'];
        if (planId == null) {
          return const LearningPlanListPage();
        }
        return FutureBuilder<LearningPlan?>(
          future: GetIt.I<LearningPlanRepository>().getPlanById(planId),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
            final plan = snapshot.data;
            if (plan == null) {
              return const LearningPlanListPage();
            }
            return LearningSessionPage(plan: plan);
          },
        );
      },
    ),
    // 复习页面
    GoRoute(
      path: '/review',
      builder: (context, state) => const ReviewPage(),
    ),
    // 学习统计页面
    GoRoute(
      path: '/plan/:planId/statistics',
      builder: (context, state) {
        final planId = state.pathParameters['planId'];
        if (planId == null) {
          return const LearningPlanListPage();
        }
        return LearningStatisticsPage(planId: planId);
      },
    ),
  ],
);
