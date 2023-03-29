  // https://developers.themoviedb.org/3/movies/get-movie-credits
  // /movie/{movie_id}/credits

  // To parse this JSON data, do
//
//     final creditsResponse = creditsResponseFromMap(jsonString);

import 'dart:convert';

import 'package:peliculas_23/models/cast.dart';

class CreditsResponse {
    CreditsResponse({
        required this.id,
        required this.cast,
        required this.crew,
    });

    int id;
    List<Cast> cast;
    List<Cast> crew;

    factory CreditsResponse.fromJson(String str) => CreditsResponse.fromMap(json.decode(str));

    // String toJson() => json.encode(toMap());

    factory CreditsResponse.fromMap(Map<String, dynamic> json) => CreditsResponse(
        id: json["id"],
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
        crew: List<Cast>.from(json["crew"].map((x) => Cast.fromMap(x))),
    );

    // Map<String, dynamic> toMap() => {
    //     "id": id,
    //     "cast": List<dynamic>.from(cast.map((x) => x.toMap())),
    //     "crew": List<dynamic>.from(crew.map((x) => x.toMap())),
    // };
}


