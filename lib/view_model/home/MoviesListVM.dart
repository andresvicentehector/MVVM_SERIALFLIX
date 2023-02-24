//import 'package:Hector_Show_data/remote/network/ApiEndPoints.dart';

import 'package:flutter/material.dart';
import 'package:Hector_Show_movie/data/remote/response/ApiResponse.dart';
import 'package:Hector_Show_movie/models/moviesList/online/MoviesMain.dart';
import 'package:Hector_Show_movie/models/moviesList/offline/moviesHive.dart';
import 'package:Hector_Show_movie/repository/movies/MovieRepoImp.dart';
import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class MoviesListVM extends ChangeNotifier {
  //Internal and private State of movie
  final _myRepo = MovieRepoImp();

  ApiResponse<Movie> movieMain = ApiResponse.loading();
  // late List<Results>? movieMainHive;
  String page = "1";
  String lang = "en-US";
  String flagUrl = "assets/images/flags/usa.png";

//el parametro de entrada es la clase api response que coje la clase movie como parametro de entrada y devuelve una respuesta
  void _setMovieMain(ApiResponse<Movie> response) {
    //print("Response :: $response");
    movieMain = response;
    notifyListeners();
  }

  /*void _setMovieMainHive(HiveResponse<MovieHive> response) {
    //print(" :: $response");
    movieMainhive = response;
    notifyListeners();
  } */

//the only way to access to movie list from the ui
  Future<void> fetchMovies(String lang, String page) async {
    print("lang " + lang + " Page" + page);
    if (await InternetConnectionChecker().hasConnection) {
      _setMovieMain(ApiResponse.loading());

      _myRepo
          .getMoviesList(lang, page)
          .then((value) => _setMovieMain(ApiResponse.completed(value)))
          .onError((error, stackTrace) =>
              _setMovieMain(ApiResponse.error(error.toString())));
    } else {
      fetchMoviesFromHive(page);
    }
  }

  Future<void> updatePageDown(
    String page1,
  ) async {
    page = (int.parse(page) - 1).toString();
    notifyListeners();
    fetchMovies(lang, page);
  }

  Future<void> updatePageUp(
    String page1,
  ) async {
    page = (int.parse(page) + 1).toString();
    notifyListeners();
    fetchMovies(lang, page);
  }

  Future<void> changeLang(String langu) async {
    if (langu == "en-US") {
      flagUrl = "assets/images/flags/usa.png";
    } else {
      flagUrl = "assets/images/flags/spain.png";
    }
    lang = langu;
    fetchMovies(lang, page);
  }

  Future<void> fetchMoviesFromHive(String page) async {
    //_setMovieMain(ApiResponse.loading());
    // _myRepo.getMoviesListFromHive(page);
  }
}
