abstract class BaseApiService {
  final String baseUrl =
      "https://api.themoviedb.org/3/tv/popular?api_key=c6aeee577586ba38e487b74dfede5deb&language=en-US&page=";

  Future<dynamic> getResponse(String url);
}
