# 学习 - Flutter 整洁架构实现

这个项目是一个汉字学习应用，采用整洁架构（Clean Architecture）实现。项目展示了如何在 Flutter 应用中应用 SOLID 原则和依赖注入等最佳实践。

## 文档

- [快速开始指南](doc/guides/getting_started.md)
- [架构设计文档](doc/architecture/clean_architecture.md)
- [API 文档](doc/api/)

## 主要功能

- 汉字学习进度追踪
- 个性化学习计划
- 学习数据统计
- 离线学习支持

## 技术栈

- Flutter
- Bloc (状态管理)
- GetIt (依赖注入)
- ObjectBox (本地数据库)
- Freezed (代码生成)

## 项目结构

```
lib/
├── core/           # 核心功能
├── data/           # 数据层
├── domain/         # 领域层
├── infrastructure/ # 基础设施
└── presentation/   # 表现层
```

## 快速开始

1. 克隆项目
```bash
git clone https://github.com/swiftdo/xuezi.git
cd xuezi
```

2. 安装依赖
```bash
flutter pub get
```

3. 运行项目
```bash
flutter run
```

更多详细信息，请查看[快速开始指南](doc/guides/getting_started.md)。

## 许可证

MIT License - 详见 [LICENSE](LICENSE) 文件

## 架构概述

项目采用分层架构，从内到外分为以下几层：

### 1. 领域层（Domain Layer）

这是最内层，包含业务逻辑和规则。不依赖于任何外部框架。

```
lib/domain/
├── entities/          # 业务实体
│   └── learned_character.dart
├── repositories/      # 仓库接口
│   └── character_repository.dart
└── usecases/         # 用例实现
    ├── get_learned_characters.dart
    └── save_learned_character.dart
```

- **实体（Entities）**：定义核心业务对象，如 `LearnedCharacter`
- **仓库接口（Repository Interfaces）**：定义数据操作的抽象接口
- **用例（Use Cases）**：实现具体的业务逻辑

### 2. 数据层（Data Layer）

负责实现领域层定义的仓库接口，处理数据持久化和外部数据访问。

```
lib/data/
├── repositories/      # 仓库实现
│   └── character_repository_impl.dart
└── datasources/      # 数据源
```

- **仓库实现**：实现领域层定义的仓库接口
- **数据源**：处理具体的数据访问逻辑

### 3. 表现层（Presentation Layer）

处理 UI 和用户交互，使用 BLoC 模式管理状态。

```
lib/presentation/
├── bloc/             # 状态管理
│   ├── character_bloc.dart
│   ├── character_event.dart
│   └── character_state.dart
├── pages/           # 页面
│   ├── home_page.dart
│   └── character_detail_page.dart
└── router/          # 路由配置
    └── router.dart
```

- **BLoC**：使用 BLoC 模式处理业务逻辑和状态管理
- **页面**：UI 实现
- **路由**：处理页面导航

### 4. 基础设施层（Infrastructure Layer）

提供技术实现和外部服务集成。

```
lib/infrastructure/
├── database/         # 数据库配置
│   └── objectbox/
└── services/         # 外部服务
```

- **数据库**：ObjectBox 配置和实现
- **服务**：外部服务集成

### 5. 核心层（Core Layer）

包含共享的工具和配置。

```
lib/core/
├── di/              # 依赖注入
├── error/           # 错误处理
├── usecase/         # 用例基类
├── network/         # 网络相关
└── theme/           # 主题配置
```

## 依赖注入

使用 GetIt 和 Injectable 实现依赖注入，主要注册以下组件：

```dart
Future<void> configureDependencies() async {
  // 仓库
  getIt.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(),
  );

  // 用例
  getIt.registerLazySingleton(
    () => GetLearnedCharacters(getIt()),
  );
  getIt.registerLazySingleton(
    () => SaveLearnedCharacter(getIt()),
  );

  // BLoC
  getIt.registerFactory(
    () => CharacterBloc(
      getLearnedCharacters: getIt(),
      saveLearnedCharacter: getIt(),
    ),
  );
}
```

## 状态管理

使用 BLoC 模式管理状态，主要包含：

- **事件（Events）**：触发状态变化的动作
  - `started`：初始化加载
  - `saved`：保存学习的汉字

- **状态（States）**：应用的不同状态
  - `initial`：初始状态
  - `loading`：加载中
  - `loaded`：加载完成
  - `error`：错误状态

## 错误处理

使用 Either 类型处理错误，返回 `Either<Failure, Success>`：

```dart
Future<Either<Failure, List<LearnedCharacter>>> getLearnedCharacters();
```

## 主要功能流程

1. 用户打开应用
   - 加载主页面
   - BLoC 发送 `started` 事件
   - 获取已学习的汉字列表

2. 用户学习新汉字
   - 进入详情页面
   - 滑动卡片学习
   - 保存学习记录
   - BLoC 发送 `saved` 事件
   - 更新已学习列表

## 架构优势

1. **可测试性**：
   - 业务逻辑与 UI 分离
   - 依赖倒置原则使得容易模拟依赖
   - 清晰的用例边界便于单元测试

2. **可维护性**：
   - 关注点分离
   - 清晰的依赖关系
   - 模块化结构

3. **可扩展性**：
   - 易于添加新功能
   - 易于更改实现细节
   - 最小化修改影响范围

4. **依赖规则**：
   - 外层依赖内层
   - 内层不知道外层的存在
   - 依赖指向领域层

## 使用的设计模式

1. **仓库模式**：抽象数据访问
2. **依赖注入**：管理依赖关系
3. **BLoC 模式**：状态管理
4. **工厂模式**：创建对象
5. **策略模式**：数据源实现


我们将功能分 4大模块，学习新知识、复习已经学过的知识、测验、然后统计分析。