import 'dart:async';
import 'package:mongo_dart/mongo_dart.dart';

final ip = '192.168.1.2';
//final ip = '127.0.0.1';

class Mongo {
  Db _db;

  Mongo() {
    _db = Db('mongodb://channels:channels123@$ip:27017/channels');
  }

  Future<List<Map<String, dynamic>>> getChannelsByCountry(
      String country) async {
    return _getChannels('^\\W*$country\\W+|\\W+$country\$');
  }

  Future<List<Map<String, dynamic>>> getChannelsByName(String name) async {
    var nameDecoded = Uri.decodeComponent(name);
    print(nameDecoded);
    return _getChannels('$nameDecoded');
  }

  Future<List<Map<String, dynamic>>> _getChannels(String pattern) async {
    try {
      await _db.open();
      var coll = _db.collection('channels');
      var result = await coll
          .find(where
              .match('title', pattern, caseInsensitive: true)
              .sortBy('created', descending: true))
          .toList();
      await _db.close();
      return result;
    } catch (error) {
      print('Error');
      print(error);
      return [];
    }
  }
}
