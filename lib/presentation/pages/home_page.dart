import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('学习列表'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCharacterSetCard(
            context,
            title: '1 - 10 汉字',
            characters: ['一', '二', '三', '四', '五', '六', '七', '八', '九', '十'],
          ),
          const SizedBox(height: 16),
          _buildCharacterSetCard(
            context,
            title: '常用问候语',
            characters: ['你', '好', '早', '晚', '再', '见'],
          ),
          const SizedBox(height: 16),
          _buildCharacterSetCard(
            context,
            title: '基础词汇',
            characters: ['我', '你', '他', '她', '它', '们'],
          ),
        ],
      ),
    );
  }

  Widget _buildCharacterSetCard(
    BuildContext context, {
    required String title,
    required List<String> characters,
  }) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text('包含 ${characters.length} 个汉字'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          context.push('/detail', extra: {
            'title': title,
            'characters': characters,
          });
        },
      ),
    );
  }
}
