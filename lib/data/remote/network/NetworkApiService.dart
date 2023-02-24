import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:Hector_Show_movie/data/remote/AppException.dart';
import 'package:Hector_Show_movie/data/remote/network/BaseApiService.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getResponse(String lang, String page) async {
    dynamic responseJson;
    try {
      final response = await http.get(
          Uri.parse(baseUrl + "language=" + lang + "&page=" + page)); //+ url
      //print("la URL TOLI :$baseUrl"); //+ url
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
