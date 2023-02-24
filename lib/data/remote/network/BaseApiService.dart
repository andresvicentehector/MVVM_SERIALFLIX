abstract class BaseApiService {
  final String baseUrl =
      "https://api.themoviedb.org/3/tv/popular?api_key=c6aeee577586ba38e487b74dfede5deb&";

  Future<dynamic> getResponse(String lang, String page);
}
