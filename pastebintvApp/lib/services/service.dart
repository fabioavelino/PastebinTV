import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pastebintv/models/channel.dart';
import 'package:pastebintv/models/channels.dart';

final url = '192.168.1.9';

Future<Channels> getChannels() async {
  http.Response response = await http.get("http://$url:8080/channels",
      headers: {"api-key": "bd3bba72-fc94-47aa-9930-50c6812471b9"}
      /* body: {"groupTitle": "[PBTV] Portugal"} */);
  print("Response ${response.body.toString()}");
  Channels channels = Channels.fromJson(json.decode(response.body));
  print(channels.groupTitle);
  print(channels.channels[0].logo);
  print(channels.channels[0].title);
  print(channels.channels[0].url);
  //await getChannelUrls(channels.channels[0].title);
  //Returns 'true' or 'false' as a String
  return channels;
}

/* Future<String> deleteUrl(String id, String url, String channel) async {
  try {
    print("deleteUrl($id, $url, $channel)");
    http.Response response = await http.post(
        "http://163.172.218.210:3000/deleteUrl",
        headers: {"api-key": "6570b2a1-8647-42ee-bf1e-349d47db1d5a"},
        body: {"id": id, "url": url, "channel": channel});
    print("Response ${response.body.toString()}");
    //Returns 'true' or 'false' as a String
    return response.body;
  } catch (error) {
    print(error);
  }
}

Future<String> channelIsWorking(String id, String url, String channel) async {
  try {
    print("channelIsWorking($id, $url, $channel)");
    http.Response response = await http.post(
        "http://163.172.218.210:3000/updateUrlStatus",
        headers: {"api-key": "6570b2a1-8647-42ee-bf1e-349d47db1d5a"},
        body: {"id": id, "url": url, "channel": channel});
    print("Response ${response.body.toString()}");
    //Returns 'true' or 'false' as a String
    return response.body;
  } catch (error) {
    print(error);
  }
} */
