// To parse this JSON data, do
//
//     final wikiResults = wikiResultsFromJson(jsonString);

import 'dart:convert';

WikiResults wikiResultsFromJson(String str) => WikiResults.fromJson(json.decode(str));

String wikiResultsToJson(WikiResults data) => json.encode(data.toJson());

class WikiResults {
  String? batchcomplete;
  Continue? wikiResultsContinue;
  Query? query;
  Limits? limits;

  WikiResults({
    this.batchcomplete,
    this.wikiResultsContinue,
    this.query,
    this.limits,
  });

  factory WikiResults.fromJson(Map<String, dynamic> json) => WikiResults(
    batchcomplete: json["batchcomplete"],
    wikiResultsContinue: json["continue"] == null ? null : Continue.fromJson(json["continue"]),
    query: json["query"] == null ? null : Query.fromJson(json["query"]),
    limits: json["limits"] == null ? null : Limits.fromJson(json["limits"]),
  );

  Map<String, dynamic> toJson() => {
    "batchcomplete": batchcomplete,
    "continue": wikiResultsContinue?.toJson(),
    "query": query?.toJson(),
    "limits": limits?.toJson(),
  };
}

class Limits {
  int? pageimages;
  int? extracts;

  Limits({
    this.pageimages,
    this.extracts,
  });

  factory Limits.fromJson(Map<String, dynamic> json) => Limits(
    pageimages: json["pageimages"],
    extracts: json["extracts"],
  );

  Map<String, dynamic> toJson() => {
    "pageimages": pageimages,
    "extracts": extracts,
  };
}

class Query {
  Map<String, Page>? pages;

  Query({
    this.pages,
  });

  factory Query.fromJson(Map<String, dynamic> json) => Query(
    pages: Map.from(json["pages"]!).map((k, v) => MapEntry<String, Page>(k, Page.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "pages": Map.from(pages!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class Page {
  int? pageid;
  int? ns;
  String? title;
  int? index;
  Thumbnail? thumbnail;
  String? pageimage;
  String? extract;

  Page({
    this.pageid,
    this.ns,
    this.title,
    this.index,
    this.thumbnail,
    this.pageimage,
    this.extract,
  });

  factory Page.fromJson(Map<String, dynamic> json) => Page(
    pageid: json["pageid"],
    ns: json["ns"],
    title: json["title"],
    index: json["index"],
    thumbnail: json["thumbnail"] == null ? null : Thumbnail.fromJson(json["thumbnail"]),
    pageimage: json["pageimage"],
    extract: json["extract"],
  );

  Map<String, dynamic> toJson() => {
    "pageid": pageid,
    "ns": ns,
    "title": title,
    "index": index,
    "thumbnail": thumbnail?.toJson(),
    "pageimage": pageimage,
    "extract": extract,
  };
}

class Thumbnail {
  String? source;
  int? width;
  int? height;

  Thumbnail({
    this.source,
    this.width,
    this.height,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
    source: json["source"],
    width: json["width"],
    height: json["height"],
  );

  Map<String, dynamic> toJson() => {
    "source": source,
    "width": width,
    "height": height,
  };
}

class Continue {
  int? gsroffset;
  String? continueContinue;

  Continue({
    this.gsroffset,
    this.continueContinue,
  });

  factory Continue.fromJson(Map<String, dynamic> json) => Continue(
    gsroffset: json["gsroffset"],
    continueContinue: json["continue"],
  );

  Map<String, dynamic> toJson() => {
    "gsroffset": gsroffset,
    "continue": continueContinue,
  };
}
