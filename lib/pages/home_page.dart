import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:go_router/go_router.dart';

import '../core/models/charater_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FlutterTts flutterTts = FlutterTts();
  final List<CharacterItem> characters1To10 = [
    CharacterItem(character: '一', desc: '一只小鸟，飞呀飞'),
    CharacterItem(character: '二', desc: '两只小猫，喵喵叫'),
    CharacterItem(character: '三', desc: '三朵小花，开呀开'),
    CharacterItem(character: '四', desc: '四只小狗，汪汪叫'),
    CharacterItem(character: '五', desc: '五根手指，拍拍手'),
    CharacterItem(character: '六', desc: '六条小鱼，游呀游'),
    CharacterItem(character: '七', desc: '七个彩虹，真美丽'),
    CharacterItem(character: '八', desc: '八只小鸟，飞呀飞'),
    CharacterItem(character: '九', desc: '九颗星星，亮晶晶'),
    CharacterItem(character: '十', desc: '十个朋友，一起玩'),
  ];

  final List<CharacterItem> firstCharacters = [
    CharacterItem(character: "天", desc: "天是蓝蓝的，白云飘"),
    CharacterItem(character: "地", desc: "地是绿绿的，小草长"),
    CharacterItem(character: "人", desc: "我是人，我会跑"),
    CharacterItem(character: "你", desc: "你是我的朋友，我们玩"),
    CharacterItem(character: "我", desc: "我是宝宝，我爱家"),
    CharacterItem(character: "他", desc: "他是哥哥，我们一起玩"),
    CharacterItem(character: "上", desc: "向上看，天好高"),
    CharacterItem(character: "下", desc: "向下看，脚丫子"),
    CharacterItem(character: "口", desc: "嘴巴小小，吃东西"),
    CharacterItem(character: "耳", desc: "耳朵听歌，听话"),
  ];

  final List<CharacterItem> secCharacters = [
    CharacterItem(character: "目", desc: "眼睛看，看到好多"),
    CharacterItem(character: "手", desc: "小手拍，拍一拍"),
    CharacterItem(character: "足", desc: "小脚跑，跑得快"),
    CharacterItem(character: "日", desc: "太阳大大，照亮我"),
    CharacterItem(character: "月", desc: "月亮亮亮，挂天上"),
    CharacterItem(character: "水", desc: "水是湿湿的，喝一口"),
    CharacterItem(character: "火", desc: "火是红红的，暖暖的"),
    CharacterItem(character: "山", desc: "山是高高的，树绿绿"),
    CharacterItem(character: "石", desc: "石头硬硬，不能动"),
    CharacterItem(character: "田", desc: "田里种，稻子长"),
  ];

  final List<CharacterItem> thirdCharacters = [
    CharacterItem(character: "禾", desc: "禾苗绿绿，稻谷熟"),
    CharacterItem(character: "对", desc: "对对好，做对事"),
    CharacterItem(character: "云", desc: "白云飘飘，像棉花"),
    CharacterItem(character: "雨", desc: "雨点滴滴，打伞走"),
    CharacterItem(character: "风", desc: "风吹吹，吹小树"),
    CharacterItem(character: "花", desc: "花儿香香，开得美"),
    CharacterItem(character: "鸟", desc: "小鸟飞飞，唱歌唱"),
    CharacterItem(character: "虫", desc: "小虫爬爬，飞飞忙"),
    CharacterItem(character: "爸", desc: "爸爸爱我，抱抱我"),
    CharacterItem(character: "妈", desc: "妈妈亲亲，抱抱我"),
  ];

  final List<CharacterItem> fourCharacters = [
    CharacterItem(character: "马", desc: "马跑跑，跑得快"),
    CharacterItem(character: "土", desc: "土是软软，种东西"),
    CharacterItem(character: "不", desc: "不哭哭，不闹闹"),
    CharacterItem(character: "画", desc: "画画画，画小鸟"),
    CharacterItem(character: "打", desc: "打打球，跳跳舞"),
    CharacterItem(character: "棋", desc: "下棋棋，黑白子"),
    CharacterItem(character: "鸡", desc: "小鸡啄啄，咯咯叫"),
    CharacterItem(character: "字", desc: "写字字，认字字"),
    CharacterItem(character: "桌", desc: "桌子上，吃饭坐"),
    CharacterItem(character: "纸", desc: "纸上画，画画好"),
  ];

  @override
  Widget build(BuildContext context) {
    final List<List<CharacterItem>> items = [
      characters1To10,
      firstCharacters,
      secCharacters,
      thirdCharacters,
      fourCharacters,
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('学习列表'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: Colors.blueAccent,
            child: ListTile(
              title: Center(
                child: Text(
                  item.map((e) {
                    return e.character;
                  }).join(","),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              onTap: () {
                context.push('/character-swiper', extra: {
                  'characters': item..shuffle(),
                  'flutterTts': flutterTts,
                });
              },
            ),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}
