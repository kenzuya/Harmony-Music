import 'package:harmonymusic/packages/flutter_lyric/lyric_parser/lyrics_parse.dart';
import 'package:harmonymusic/packages/flutter_lyric/lyric_parser/parser_json.dart';
import 'package:harmonymusic/packages/flutter_lyric/lyric_parser/parser_lrc.dart';
import 'package:harmonymusic/packages/flutter_lyric/lyric_parser/parser_qrc.dart';
import 'package:harmonymusic/packages/flutter_lyric/lyrics_reader_model.dart';
import 'package:harmonymusic/utils/helper.dart';

///smart parser
///Parser is automatically selected
class ParserSmart extends LyricsParse {
  ParserSmart(super.lyric);

  @override
  List<LyricsLineModel> parseLines({bool isMain = true}) {
    // Try JSON format first
    final json = ParserJson(lyric);
    if (json.isOK()) {
      printINFO("Using JSON format");
      return json.parseLines(isMain: isMain);
    }

    var qrc = ParserQrc(lyric);
    if (qrc.isOK()) {
      printINFO("Using QRC format");
      return qrc.parseLines(isMain: isMain);
    }
    printINFO("Using LRC format");
    return ParserLrc(lyric).parseLines(isMain: isMain);
  }
}
