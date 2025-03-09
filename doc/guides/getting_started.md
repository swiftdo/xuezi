# 快速开始指南

## 项目简介

这是一个基于 Flutter 开发的汉字学习应用，采用整洁架构（Clean Architecture）实现。本指南将帮助你快速设置和运行项目。

## 环境要求

- Flutter SDK: 3.0.0 或更高版本
- Dart SDK: 3.0.0 或更高版本
- IDE: Android Studio、VS Code 或其他支持 Flutter 的 IDE
- Git

## 安装步骤

1. **克隆项目**

```bash
git clone https://github.com/swiftdo/xuezi.git
cd xuezi
```

2. **安装依赖**

```bash
flutter pub get
```

3. **生成必要的代码**

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. **运行项目**

```bash
flutter run
```

## 项目结构

```
lib/
├── core/           # 核心功能
├── data/           # 数据层
├── domain/         # 领域层
├── infrastructure/ # 基础设施
└── presentation/   # 表现层
```

## 开发指南

### 添加新功能

1. 在 `domain/entities` 中定义实体
2. 在 `domain/repositories` 中定义仓库接口
3. 在 `domain/usecases` 中实现用例
4. 在 `data/repositories` 中实现仓库
5. 在 `presentation/bloc` 中添加状态管理
6. 在 `presentation/pages` 中实现 UI

### 运行测试

```bash
# 运行单元测试
flutter test

# 运行集成测试
flutter test integration_test
```

### 代码生成

当修改了模型类或 BLoC 后，需要重新生成代码：

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## 常见问题

### 1. 生成代码时遇到冲突

解决方案：使用 `--delete-conflicting-outputs` 参数重新生成

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 2. 依赖注入相关错误

确保在 `lib/core/di/injection.dart` 中正确注册了所有依赖。

## 贡献指南

1. Fork 项目
2. 创建特性分支
3. 提交改动
4. 推送到分支
5. 创建 Pull Request

## 有用的链接

- [项目文档](../architecture/clean_architecture.md)
- [API 文档](../api/) 