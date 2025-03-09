import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:objectbox/objectbox.dart';
import 'package:xuezi/models/learned_character.dart';

import '../objectbox.dart';

class HomePage extends StatefulWidget {
  final List<String> shuffledCharacters;
  final List<String> firstShuffledCharacters;
  final FlutterTts flutterTts;

  const HomePage({
    super.key,
    required this.shuffledCharacters,
    required this.firstShuffledCharacters,
    required this.flutterTts,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> learnedCharacters = [];
  late Box<LearnedCharacter> learnedCharacterBox;

  @override
  void initState() {
    super.initState();
    learnedCharacterBox = store.box<LearnedCharacter>();
    _loadLearnedCharacters();
  }

  void _loadLearnedCharacters() {
    final characters = learnedCharacterBox.getAll();
    setState(() {
      learnedCharacters = characters.map((c) => c.character).toList();
    });
  }

  void _saveLearnedCharacter(String character) {
    if (!learnedCharacters.contains(character)) {
      final newCharacter = LearnedCharacter(character: character);
      learnedCharacterBox.put(newCharacter);
      setState(() {
        learnedCharacters.add(character);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  'characters': widget.shuffledCharacters,
                  'flutterTts': widget.flutterTts,
                  'onCharacterLearned': _saveLearnedCharacter,
                });
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
                  'characters': widget.firstShuffledCharacters,
                  'flutterTts': widget.flutterTts,
                  'onCharacterLearned': _saveLearnedCharacter,
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
