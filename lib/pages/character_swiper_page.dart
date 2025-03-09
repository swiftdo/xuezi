import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_tts/flutter_tts.dart';

class CharacterSwiperPage extends StatefulWidget {
  final List<String> characters;
  final FlutterTts flutterTts;
  final Function(String) onCharacterLearned; // 新增回调函数

  const CharacterSwiperPage({
    super.key,
    required this.characters,
    required this.flutterTts,
    required this.onCharacterLearned, // 添加到构造函数
  });

  @override
  State<CharacterSwiperPage> createState() => _CharacterSwiperPageState();
}

class _CharacterSwiperPageState extends State<CharacterSwiperPage> {
  int currentIndex = 0;

  Future<void> _speak(String text) async {
    await widget.flutterTts.setLanguage('zh-CN');
    await widget.flutterTts.awaitSpeakCompletion(true);
    await widget.flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('汉字学习'),
      ),
      body: CardSwiper(
        cardsCount: widget.characters.length,
        onSwipe: (previousIndex, currentIndex, direction) {
          this.currentIndex = currentIndex ?? 0;
          // 当卡片滑动时，调用回调函数记录已读汉字
          widget.onCharacterLearned(widget.characters[this.currentIndex]);
          return true;
        },
        cardBuilder: (context, index, horizontalOffsetPercentage,
            verticalOffsetPercentage) {
          return GestureDetector(
            onTap: () {
              _speak(widget.characters[index]);
            },
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: Text(
                widget.characters[index],
                style: const TextStyle(fontSize: 200),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _speak(widget.characters[currentIndex]);
              },
              child: const Text('播放语音'),
            ),
          ],
        ),
      ),
    );
  }
}
