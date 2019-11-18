import 'dart:io';
import 'package:m3u/m3u.dart';
import 'package:http/http.dart' as http;

class M3U {
  String fileName;
  String url;

  M3U(this.fileName, this.url);

  getContent() async {
    final response = await http.get(
        "http://163.172.223.32/pastbin/m3u/20191118/1574030229-WSV1MzrE.txt");
    final playlist = await M3uParser.parse(response.body);
  }
}
