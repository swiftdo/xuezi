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

  final List<String> firstCharacters = [
    "天",
    "地",
    "人",
    "你",
    "我",
    "他",
    "一",
    "二",
    "三",
    "四",
    "五",
    "上",
    "下",
    "口",
    "耳",
    "目",
    "手",
    "足",
    "站",
    "坐",
    "日",
    "月",
    "水",
    "火",
    "山",
    "石",
    "田",
    "禾",
    "对",
    "云",
    "雨",
    "风",
    "花",
    "鸟",
    "虫",
    "六",
    "七",
    "八",
    "九",
    "十",
    "爸",
    "妈",
    "马",
    "土",
    "不",
    "画",
    "打",
    "棋",
    "鸡",
    "字",
    "词",
    "语",
    "句",
    "桌",
    "纸",
    "妹",
    "奶",
    "小",
    "桥",
  ];

  @override
  Widget build(BuildContext context) {
    List<String> shuffledCharacters = List<String>.from(characters1To10)
      ..shuffle();

    List<String> firstShuffledCharacters = firstCharacters..shuffle();

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
          Card(
            color: Colors.blueAccent,
            child: ListTile(
              title: const Center(
                child: Text(
                  '一级汉字',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () {
                context.push('/character-swiper', extra: {
                  'characters': firstShuffledCharacters,
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
