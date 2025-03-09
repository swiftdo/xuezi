import 'package:flutter/material.dart';

/// 应用主题配色方案
/// 采用中国传统色彩系统，结合现代UI设计理念
class AppColors {
  // 主色调：青竹色系
  static const Color primary = Color(0xFF3A8C82); // 青竹绿
  static const Color primaryLight = Color(0xFF7AB8B0); // 浅青竹
  static const Color primaryDark = Color(0xFF1E5B53); // 深青竹

  // 点缀色：中国红系
  static const Color accent = Color(0xFFD85A4E); // 中国红
  static const Color accentLight = Color(0xFFE88B82); // 浅红
  static const Color accentDark = Color(0xFFA93931); // 深红

  // 中性色调
  static const Color neutral1 = Color(0xFF2C3E50); // 深墨
  static const Color neutral2 = Color(0xFF34495E); // 墨灰
  static const Color neutral3 = Color(0xFF7F8C8D); // 瓦灰
  static const Color neutral4 = Color(0xFFBDC3C7); // 淡灰
  static const Color neutral5 = Color(0xFFF5F6F7); // 霜白

  // 功能色
  static const Color success = Color(0xFF27AE60); // 松绿
  static const Color warning = Color(0xFFF1C40F); // 枫黄
  static const Color error = Color(0xFFE74C3C); // 朱红
  static const Color info = Color(0xFF3498DB); // 靛青

  // 学习进度相关色彩
  static const Color masteryHigh = Color(0xFF2ECC71); // 高掌握度
  static const Color masteryMedium = Color(0xFFF1C40F); // 中掌握度
  static const Color masteryLow = Color(0xFFE74C3C); // 低掌握度

  // 渐变色
  static const List<Color> primaryGradient = [
    Color(0xFF3A8C82),
    Color(0xFF7AB8B0),
  ];

  static const List<Color> accentGradient = [
    Color(0xFFD85A4E),
    Color(0xFFE88B82),
  ];

  // 卡片阴影
  static List<BoxShadow> cardShadow = [
    BoxShadow(
      color: neutral1.withOpacity(0.1),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ];

  // 统计卡片颜色
  static const List<Color> statCardColors = [
    Color(0xFF3A8C82), // 青竹绿
    Color(0xFFD85A4E), // 中国红
    Color(0xFF27AE60), // 松绿
    Color(0xFF3498DB), // 靛青
  ];
}
