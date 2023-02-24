import 'package:Hector_Show_movie/models/moviesList/online/MoviesMain.dart';
import 'package:Hector_Show_movie/models/moviesList/offline/moviesHive.dart';

class MovieRepo {
  Future<Movie?> getMoviesList(String lang, String page) async {}
  Future<MovieHive?> getMoviesListFromHive(String page) async {}
}
