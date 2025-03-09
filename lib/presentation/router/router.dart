import 'package:go_router/go_router.dart';
import '../pages/home_page.dart';

// 这里假设 HomePage 等页面在对应的文件中已经正确导入
final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
