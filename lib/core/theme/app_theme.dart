import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      useMaterial3: true,
      textTheme: const TextTheme(
        // 用于页面标题
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        // 用于主要内容（如汉字显示）
        displayLarge: TextStyle(
          fontSize: 120,
          fontWeight: FontWeight.bold,
        ),
        // 用于按钮文字
        labelLarge: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        // 用于普通文本
        bodyLarge: TextStyle(
          fontSize: 20,
        ),
      ),
      // 增加按钮大小
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20),
          minimumSize: const Size(120, 60),
        ),
      ),
      // 增加 FloatingActionButton 大小
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        sizeConstraints: BoxConstraints.tightFor(width: 80, height: 80),
        iconSize: 32,
      ),
      // 增加图标大小
      iconTheme: const IconThemeData(
        size: 32,
      ),
    );
  }
}
