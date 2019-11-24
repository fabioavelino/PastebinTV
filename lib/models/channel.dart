import 'package:equatable/equatable.dart';

class Channel extends Equatable {
  final String id;
  final String title;
  final String logo;
  final List<String> urls;

  Channel(this.id, this.title, this.logo, this.urls);

  @override
  List<Object> get props => [title, logo, urls];

  factory Channel.fromJson(Map<String, dynamic> json) {
    List<dynamic> urlsFromJson = json['urls'] ?? [];
    List<String> urls =
        urlsFromJson.map((channel) => channel as String).toList();
    return Channel(json['_id'], json['title'], json['tvgLogo'], urls);
  }
}
