# Flutter 整洁架构实现说明

## 整洁架构简介

整洁架构（Clean Architecture）是一种软件设计哲学，它强调关注点分离和依赖规则。在我们的实现中，代码被组织成同心圆的层次结构，每一层都有其特定的职责和规则。

## 架构层次

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

#### 详细说明

- **实体（Entities）**
  - 定义核心业务对象
  - 包含业务规则
  - 不依赖于外部框架
  - 示例：`LearnedCharacter` 类定义了学习汉字的核心属性

- **仓库接口（Repository Interfaces）**
  - 定义数据操作的抽象接口
  - 遵循依赖倒置原则
  - 由外层实现具体的数据访问逻辑

- **用例（Use Cases）**
  - 实现具体的业务逻辑
  - 每个用例对应一个具体的业务操作
  - 依赖于仓库接口，而不是具体实现

### 2. 数据层（Data Layer）

负责实现领域层定义的仓库接口，处理数据持久化和外部数据访问。

```
lib/data/
├── repositories/      # 仓库实现
│   └── character_repository_impl.dart
└── datasources/      # 数据源
```

#### 详细说明

- **仓库实现**
  - 实现领域层定义的仓库接口
  - 协调不同数据源
  - 处理数据转换和缓存策略

- **数据源**
  - 处理具体的数据访问逻辑
  - 可以是本地数据库、网络 API 等
  - 实现数据持久化和检索

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

#### 详细说明

- **BLoC 模式**
  - 处理业务逻辑和状态管理
  - 将 UI 与业务逻辑分离
  - 实现响应式的状态更新

- **页面和组件**
  - 实现用户界面
  - 响应用户交互
  - 展示应用状态

- **路由管理**
  - 处理页面导航
  - 管理页面转换
  - 处理深层链接

### 4. 基础设施层（Infrastructure Layer）

提供技术实现和外部服务集成。

```
lib/infrastructure/
├── database/         # 数据库配置
│   └── objectbox/
└── services/         # 外部服务
```

#### 详细说明

- **数据库配置**
  - ObjectBox 数据库配置
  - 数据库模式定义
  - 数据库迁移管理

- **外部服务集成**
  - 第三方服务配置
  - API 客户端实现
  - 服务接口定义

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

#### 详细说明

- **依赖注入**
  - 使用 GetIt 管理依赖
  - 配置服务定位器
  - 管理对象生命周期

- **错误处理**
  - 定义错误类型
  - 实现错误转换
  - 提供错误处理工具

- **基础设施**
  - 网络配置
  - 主题定义
  - 共享工具类

## 依赖规则

1. 源代码依赖只能指向内层
2. 内层不应该知道外层的存在
3. 外层的变化不应该影响内层
4. 所有依赖都应该指向抽象而不是具体实现

## 数据流

1. UI 调用 BLoC 方法
2. BLoC 执行用例
3. 用例通过仓库接口获取数据
4. 仓库实现调用适当的数据源
5. 数据按相反方向流回 UI

## 测试策略

1. **单元测试**
   - 测试用例
   - 测试仓库实现
   - 测试 BLoC 逻辑

2. **集成测试**
   - 测试数据流
   - 测试依赖注入
   - 测试组件交互

3. **UI 测试**
   - 测试页面渲染
   - 测试用户交互
   - 测试导航流程 