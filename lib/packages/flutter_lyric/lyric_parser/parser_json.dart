import 'dart:convert';

import 'package:harmonymusic/packages/flutter_lyric/models/lyrics_syllable.dart';
import 'package:harmonymusic/packages/flutter_lyric/lyric_parser/lyrics_parse.dart';
import 'package:harmonymusic/packages/flutter_lyric/lyrics_reader_model.dart';

class ParserJson extends LyricsParse {
  ParserJson(super.lyric);

  @override
  List<LyricsLineModel> parseLines({bool isMain = true}) {
    final List<dynamic> parsed = json.decode(lyric);
    final List<LyricsSyllable> lyricsLines =
        parsed.map((line) => LyricsSyllable.fromJson(line)).toList();

    List<LyricsLineModel> lineList = [];

    for (var line in lyricsLines) {
      List<LyricSpanInfo> spanList = [];
      int startIndex = 0;

      for (var word in line.words) {
        var span = LyricSpanInfo()
          ..raw = word.word
          ..start = (word.start * 1000).round() // Convert to milliseconds
          ..duration = ((word.end - word.start) * 1000).round()
          ..index = startIndex
          ..length = word.word.length;

        spanList.add(span);
        startIndex += word.word.length;
      }

      var lineModel = LyricsLineModel()
        ..mainText = line.text
        ..startTime = (line.start * 1000).round() // Convert to milliseconds
        ..endTime = (line.end * 1000).round()
        ..spanList = spanList;

      lineList.add(lineModel);
    }

    return lineList;
  }

  @override
  bool isOK() {
    try {
      final decoded = json.decode(lyric);
      return decoded is List && decoded.isNotEmpty;
    } catch (e) {
      return false;
    }
  }
}
