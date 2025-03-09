import 'package:objectbox/objectbox.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:xuezi/objectbox.g.dart';

// 定义全局的 store 变量
late Store store;

@pragma('vm:entry-point')
Future<void> initObjectBox() async {
  final docsDir = await getApplicationDocumentsDirectory();
  store = await openStore(directory: p.join(docsDir.path, "objectbox"));
}
