import 'package:hive/hive.dart';
import 'package:Hector_Show_movie/data/remote/network/BaseApiService.dart';
import 'package:Hector_Show_movie/data/remote/network/NetworkApiService.dart';
import 'package:Hector_Show_movie/models/moviesList/online/MoviesMain.dart';
import 'package:Hector_Show_movie/repository/movies/MovieRepo.dart';
import 'package:Hector_Show_movie/data/remote/network/ApiEndPoints.dart';

import '../../models/moviesList/offline/moviesHive.dart';

class MovieRepoImp implements MovieRepo {
  BaseApiService _apiService = NetworkApiService();

  Box box = Hive.box("moviesBox");

  @override
  Future<Movie?> getMoviesList(lang, page) async {
    try {
      dynamic response = await _apiService.getResponse(
        lang, page,

        // ApiEndPoints().getMoviesLang,
        //ApiEndPoints().getMoviesPage,
      );
      //print("Json from API: $response"); //ese response es un JSON Que ha pillado de la API

      final jsonData = Movie.fromJson(response);
      final jsonDataHive = MovieHive.fromJson(response);

      await box.put(jsonData.page, jsonDataHive.results);
      //print("valores del box:" + box.keys.toString());
      //print("BOXSAVED");

      return jsonData;
    } catch (e) {
      throw e;
    }
  }

  Future<MovieHive?> getMoviesListFromHive(String page) async {
    try {
      // final dataHive = box.toMap() as MovieHive;

      //return dataHive;
    } catch (e) {
      throw e;
    }
  }
}
