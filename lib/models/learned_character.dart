import 'package:objectbox/objectbox.dart';

@Entity()
class LearnedCharacter {
  int id = 0;
  String character;

  LearnedCharacter({required this.character});
}
