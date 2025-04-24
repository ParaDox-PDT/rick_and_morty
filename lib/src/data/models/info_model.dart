import 'dart:convert';

Info infoFromJson(String str) => Info.fromJson(json.decode(str));

String infoToJson(Info data) => json.encode(data.toJson());

class Info {
  Info({this.count, this.pages, this.next, this.prev});

  Info.fromJson(dynamic json) {
    count = json['count'];
    pages = json['pages'];
    next = json['next'];
    prev = json['prev'];
  }

  int? count;
  int? pages;
  String? next;
  String? prev;

  Info copyWith({int? count, int? pages, String? next, dynamic prev}) => Info(
    count: count ?? this.count,
    pages: pages ?? this.pages,
    next: next ?? this.next,
    prev: prev ?? this.prev,
  );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['pages'] = pages;
    map['next'] = next;
    map['prev'] = prev;
    return map;
  }
}
