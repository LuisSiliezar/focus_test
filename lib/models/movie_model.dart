class Movie {
  Movie({
    required this.results,
  });
  late final List<Results> results;

  Movie.fromJson(Map<String, dynamic> json) {
    results =
        List.from(json['results']).map((e) => Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['results'] = results.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Results {
  Results({
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });
  late final int id;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final String posterPath;
  late final String releaseDate;
  late final dynamic voteAverage;
  late final int voteCount;

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'] ??
        'https://media.newyorker.com/photos/5f9c20cdd2318879f732ac8e/4:3/w_2560,h_1920,c_limit/Brody-MovieBuzz.jpg';
    releaseDate = json['release_date'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['original_language'] = originalLanguage;
    _data['original_title'] = originalTitle;
    _data['overview'] = overview;
    _data['popularity'] = popularity;
    _data['poster_path'] = posterPath;
    _data['release_date'] = releaseDate;
    _data['vote_average'] = voteAverage;
    _data['vote_count'] = voteCount;
    return _data;
  }
}
