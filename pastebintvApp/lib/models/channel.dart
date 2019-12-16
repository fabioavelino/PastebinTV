import 'package:equatable/equatable.dart';

class Channel extends Equatable {
  final String id;
  final String title;
  final String logo;
  final String url;

  Channel(this.id, this.title, this.logo, this.url);

  @override
  List<Object> get props => [title, logo, url];

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(json['_id'], json['title'], json['tvgLogo'], json['url']);
  }

  Channel copyWith({String id, String title, String logo, String url}) {
    return Channel(
        id ?? this.id, title ?? this.title, logo ?? this.logo, url ?? this.url);
  }
}
