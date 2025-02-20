import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FlutterTts flutterTts = FlutterTts();
  final List<String> characters1To10 = [
    '一',
    '二',
    '三',
    '四',
    '五',
    '六',
    '七',
    '八',
    '九',
    '十'
  ];


  @override
  Widget build(BuildContext context) {
    List<String> shuffledCharacters = List<String>.from(characters1To10)..shuffle();

    return Scaffold(
      appBar: AppBar(
        title: const Text('学习列表'),
      ),
      body: ListView(
        children: [
          Card(
            color: Colors.blueAccent,
            child: ListTile(
              title: const Center(
                child: Text(
                  '1 - 10 汉字',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () {
                context.push('/character-swiper', extra: {
                  'characters': shuffledCharacters,
                  'flutterTts': flutterTts,
                });
                // context.go('/character-swiper', extra: {
                //   'characters': shuffledCharacters,
                //   'flutterTts': flutterTts,
                // });
              },
            ),
          ),
        ],
      ),
    );
  }
}