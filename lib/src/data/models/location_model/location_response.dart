import 'dart:convert';

import 'package:rick_and_morty/src/data/models/info_model.dart';

LocationResponse locationResponseFromJson(String str) =>
    LocationResponse.fromJson(json.decode(str));

String locationResponseToJson(LocationResponse data) => json.encode(data.toJson());

class LocationResponse {
  LocationResponse({this.info, this.results});

  LocationResponse.fromJson(Map<String,dynamic> json) {
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    if (json['results'] != null) {
      results = [];
      json['results'].forEach(( v) {
        results?.add(Location.fromJson(v));
      });
    }
  }

  Info? info;
  List<Location>? results;

  LocationResponse copyWith({Info? info, List<Location>? results}) =>
      LocationResponse(info: info ?? this.info, results: results ?? this.results);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (info != null) {
      map['info'] = info?.toJson();
    }
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {
  Location({this.id, this.name, this.type, this.dimension, this.residents, this.url, this.created});

  Location.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    dimension = json['dimension'];
    residents = json['residents'] != null ? json['residents'].cast<String>() : [];
    url = json['url'];
    created = json['created'];
  }

  int? id;
  String? name;
  String? type;
  String? dimension;
  List<String>? residents;
  String? url;
  String? created;

  Location copyWith({
    int? id,
    String? name,
    String? type,
    String? dimension,
    List<String>? residents,
    String? url,
    String? created,
  }) => Location(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    dimension: dimension ?? this.dimension,
    residents: residents ?? this.residents,
    url: url ?? this.url,
    created: created ?? this.created,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['type'] = type;
    map['dimension'] = dimension;
    map['residents'] = residents;
    map['url'] = url;
    map['created'] = created;
    return map;
  }
}
