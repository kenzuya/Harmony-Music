import 'dart:convert';

List<LyricsSyllable> lyricsSyllableFromJson(String str) =>
    List<LyricsSyllable>.from(json.decode(str).map((x) => LyricsSyllable.fromJson(x)));

// String lyricsSyllableToJson(List<LyricsSyllable> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LyricsSyllable {
  double start;
  double end;
  String text;
  String language;
  List<Word> words;

  LyricsSyllable({
    required this.start,
    required this.end,
    required this.text,
    required this.language,
    required this.words,
  });

  factory LyricsSyllable.fromJson(Map<String, dynamic> json) => LyricsSyllable(
        start: json["start"]?.toDouble(),
        end: json["end"]?.toDouble(),
        text: json["text"],
        language: json["language"],
        words: List<Word>.from(json["words"].map((x) => Word.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "end": end,
        "text": text,
        "language": language,
        "words": List<dynamic>.from(words.map((x) => x.toJson())),
      };
}

class Word {
  String word;
  double start;
  double end;
  String score;
  List<Syllable> syllables;

  Word({
    required this.word,
    required this.start,
    required this.end,
    required this.score,
    required this.syllables,
  });

  factory Word.fromJson(Map<String, dynamic> json) => Word(
        word: json["word"],
        start: json["start"]?.toDouble(),
        end: json["end"]?.toDouble(),
        score: json["score"],
        syllables: List<Syllable>.from(json["syllables"].map((x) => Syllable.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "word": word,
        "start": start,
        "end": end,
        "score": score,
        "syllables": List<dynamic>.from(syllables.map((x) => x.toJson())),
      };
}

class Syllable {
  String syllable;
  double start;
  double end;

  Syllable({
    required this.syllable,
    required this.start,
    required this.end,
  });

  factory Syllable.fromJson(Map<String, dynamic> json) => Syllable(
        syllable: json["syllable"],
        start: json["start"]?.toDouble(),
        end: json["end"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "syllable": syllable,
        "start": start,
        "end": end,
      };
}
