import 'dart:async';
import 'package:mongo_dart/mongo_dart.dart';

final ip = '192.168.1.2';
//final ip = '127.0.0.1';

class Mongo {
  Db _db;

  Mongo() {
    _db = Db('mongodb://channels:channels123@$ip:27017/channels');
  }

  Future<List<Map<String, dynamic>>> getChannels() async {
    try {
      await _db.open();
      var coll = _db.collection('channels');
      const country = 'fr';
      print('^\\W*$country\\W+|\\W+$country\$');
      var result = await coll
          .find(where.match('title', '^\\W*$country\\W+|\\W+$country\$',
              caseInsensitive: true))
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
