import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pastebintv/models/channel.dart';
import 'package:pastebintv/models/channels.dart';

Future<Channels> getChannels() async {
  http.Response response = await http.post(
      "http://163.172.218.210:3000/getChannels",
      headers: {"api-key": "6570b2a1-8647-42ee-bf1e-349d47db1d5a"},
      body: {"groupTitle": "[PBTV] Portugal"});
  print("Response ${response.body.toString()}");
  Channels channels = Channels.fromJson(json.decode(response.body));
  print(channels.groupTitle);
  print(channels.channels[0].logo);
  print(channels.channels[0].title);
  print(channels.channels[0].urls);
  //await getChannelUrls(channels.channels[0].title);
  //Returns 'true' or 'false' as a String
  return channels;
}

Future<Channel> getChannelUrls(Channel channel) async {
  http.Response response =
      await http.post("http://163.172.218.210:3000/getUrls", headers: {
    "api-key": "6570b2a1-8647-42ee-bf1e-349d47db1d5a"
  }, body: {
    "groupTitle": "[PBTV] Portugal",
    "channel": channel.title,
    "offset": "0",
    "limit": "5"
  });
  print("Response ${response.body.toString()}");
  Channel channelWithOnlyUrls = Channel.fromJson(json.decode(response.body));
  Channel channelComplete = channel.copyWith(urls: channelWithOnlyUrls.urls);
  return channelComplete;
}

Future<String> deleteUrl(String id, String url, String channel) async {
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
}
