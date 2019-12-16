import 'dart:convert';

import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import './mongo.dart';

final apiKey = 'bd3bba72-fc94-47aa-9930-50c6812471b9';

void main() async {
  var app = Router();
  app.get('/channels', (Request request) async {
    /* if (request.headers['api-key'] != apiKey) {
      return Response.notFound('');
    } */
    var mongo = Mongo();
    var result = await mongo.getChannels();
    return Response.ok(jsonEncode(result),
        headers: {'Content-Type': 'application/json'});
  });

  /* app.get('/user/<user>', (Request request, String user) {
    return Response.ok('hello $user');
  }); */

  var server = await serve(app.handler, '192.168.1.9', 8080);
}
