import 'objectbox.g.dart';

// 定义全局的 store 变量
late Store store;

// 初始化 ObjectBox 的函数
Future<void> initObjectBox() async {
  store = await openStore();
}
