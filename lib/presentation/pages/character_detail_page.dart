import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  late SharedPreferences _prefs;
  static const String _learnedCharsKey = 'learned_characters';

  @override
  void initState() {
    super.initState();
    flutterTts.setLanguage("zh-CN");
    _initPrefs();
  }

  Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: theme.textTheme.headlineLarge,
        ),
      ),
      body: SafeArea(
        child: Column(
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
                      width: size.width,
                      height: size.height * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withAlpha(51),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Center(
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Text(
                                    widget.characters[index],
                                    style: theme.textTheme.displayLarge,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                '点击卡片听发音',
                                style: theme.textTheme.bodyLarge,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: 'undo',
                    onPressed: () {
                      controller.undo();
                    },
                    child: const Icon(Icons.undo),
                  ),
                  FloatingActionButton(
                    heroTag: 'speak',
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
      _saveLearnedCharacter(character);
    }
    return true;
  }

  Future<void> _saveLearnedCharacter(String character) async {
    final learnedChars = _prefs.getStringList(_learnedCharsKey) ?? [];
    if (!learnedChars.contains(character)) {
      learnedChars.add(character);
      await _prefs.setStringList(_learnedCharsKey, learnedChars);
    }
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
