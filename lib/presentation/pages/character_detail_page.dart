import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:xuezi/domain/entities/learned_character.dart';
import 'package:xuezi/infrastructure/database/objectbox/objectbox.dart';

class CharacterDetailPage extends StatefulWidget {
  final List<String> characters;
  final String title;

  const CharacterDetailPage({
    super.key,
    required this.characters,
    required this.title,
  });

  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  final FlutterTts flutterTts = FlutterTts();
  final CardSwiperController controller = CardSwiperController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    flutterTts.setLanguage("zh-CN");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: CardSwiper(
              controller: controller,
              cardsCount: widget.characters.length,
              onSwipe: _onSwipe,
              onUndo: _onUndo,
              numberOfCardsDisplayed: 3,
              backCardOffset: const Offset(40, 40),
              padding: const EdgeInsets.all(24.0),
              cardBuilder: (context, index, _, __) {
                return GestureDetector(
                  onTap: () {
                    flutterTts.speak(widget.characters[index]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withAlpha(51),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        widget.characters[index],
                        style: const TextStyle(fontSize: 80),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    controller.undo();
                  },
                  child: const Icon(Icons.undo),
                ),
                FloatingActionButton(
                  onPressed: () {
                    flutterTts.speak(widget.characters[currentIndex]);
                  },
                  child: const Icon(Icons.volume_up),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    if (currentIndex != null) {
      this.currentIndex = currentIndex;
    }
    final character = widget.characters[previousIndex];
    if (direction == CardSwiperDirection.right) {
      final learnedChar = LearnedCharacter(character: character);
      store.box<LearnedCharacter>().put(learnedChar);
    }
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    this.currentIndex = currentIndex;
    return true;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
