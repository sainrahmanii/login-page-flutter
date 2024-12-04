// To parse this JSON data, do
//
//     final popularFilmResponseModel = popularFilmResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:project_flutter/model/film_model.dart';

PopularFilmResponseModel popularFilmResponseModelFromJson(String str) =>
    PopularFilmResponseModel.fromJson(json.decode(str));

String popularFilmResponseModelToJson(PopularFilmResponseModel data) =>
    json.encode(data.toJson());

class PopularFilmResponseModel {
  int? page;
  List<FilmModel>? results;
  int? totalPages;
  int? totalResults;

  PopularFilmResponseModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory PopularFilmResponseModel.fromJson(Map<String, dynamic> json) =>
      PopularFilmResponseModel(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<FilmModel>.from(
                json["results"]!.map((x) => FilmModel.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
