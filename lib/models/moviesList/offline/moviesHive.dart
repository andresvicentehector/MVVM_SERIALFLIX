import 'package:hive/hive.dart';

part 'moviesHive.g.dart';

@HiveType(typeId: 0)
class MovieHive extends HiveObject {
  dynamic page;
  @HiveField(0)
  List<ResultsHive>? results;
  @HiveField(2)
  dynamic totalPages;
  @HiveField(3)
  dynamic totalResults;

  MovieHive({
    this.page,
    this.results = const [],
    this.totalPages,
    this.totalResults,
  });

  MovieHive.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <ResultsHive>[];
      json['results'].forEach((v) {
        results!.add(new ResultsHive.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

@HiveType(typeId: 1)
class ResultsHive extends HiveObject {
  @HiveField(0)
  String? backdropPath;
  @HiveField(1)
  String? firstAirDate;
  @HiveField(2)
  List<dynamic>? genreIds;
  @HiveField(3)
  dynamic id;
  @HiveField(4)
  String? name;
  @HiveField(5)
  List<String>? originCountry;
  @HiveField(6)
  String? originalLanguage;
  @HiveField(7)
  String? originalName;
  @HiveField(8)
  String? overview;
  @HiveField(9)
  dynamic popularity;
  @HiveField(10)
  String? posterPath;
  @HiveField(11)
  dynamic voteAverage;
  @HiveField(12)
  dynamic voteCount;

  ResultsHive(
      {this.backdropPath,
      this.firstAirDate,
      this.genreIds,
      this.id,
      this.name,
      this.originCountry,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.voteAverage,
      this.voteCount});

  ResultsHive.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    firstAirDate = json['first_air_date'];
    genreIds = json['genre_ids'].cast<dynamic>();
    id = json['id'];
    name = json['name'];
    originCountry = json['origin_country'].cast<String>();
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backdrop_path'] = this.backdropPath;
    data['first_air_date'] = this.firstAirDate;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    data['original_language'] = this.originalLanguage;
    data['original_name'] = this.originalName;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}
