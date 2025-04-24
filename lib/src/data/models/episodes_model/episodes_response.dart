import 'dart:convert';

import 'package:rick_and_morty/src/data/models/info_model.dart';

EpisodesResponse episodesResponseFromJson(String str) =>
    EpisodesResponse.fromJson(json.decode(str));

String episodesResponseToJson(EpisodesResponse data) => json.encode(data.toJson());

class EpisodesResponse {
  EpisodesResponse({this.info, this.results});

  EpisodesResponse.fromJson(Map<String,dynamic> json) {
    info = json['info'] != null ? Info.fromJson(json['info']) : null;
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Episode.fromJson(v));
      });
    }
  }

  Info? info;
  List<Episode>? results;

  EpisodesResponse copyWith({Info? info, List<Episode>? results}) =>
      EpisodesResponse(info: info ?? this.info, results: results ?? this.results);

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

Episode episodeFromJson(String str) => Episode.fromJson(json.decode(str));

String episodeToJson(Episode data) => json.encode(data.toJson());

class Episode {
  Episode({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.characters,
    this.url,
    this.created,
  });

  Episode.fromJson(Map<String,dynamic> json) {
    id = json['id'];
    name = json['name'];
    airDate = json['air_date'];
    episode = json['episode'];
    characters = json['characters'] != null ? json['characters'].cast<String>() : [];
    url = json['url'];
    created = json['created'];
  }

  int? id;
  String? name;
  String? airDate;
  String? episode;
  List<String>? characters;
  String? url;
  String? created;

  Episode copyWith({
    int? id,
    String? name,
    String? airDate,
    String? episode,
    List<String>? characters,
    String? url,
    String? created,
  }) => Episode(
    id: id ?? this.id,
    name: name ?? this.name,
    airDate: airDate ?? this.airDate,
    episode: episode ?? this.episode,
    characters: characters ?? this.characters,
    url: url ?? this.url,
    created: created ?? this.created,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['air_date'] = airDate;
    map['episode'] = episode;
    map['characters'] = characters;
    map['url'] = url;
    map['created'] = created;
    return map;
  }
}
