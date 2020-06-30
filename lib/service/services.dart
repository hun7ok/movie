import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie2/model/movie_model.dart';

class Services {
  static const String url = 'http://api.yousmartdata.net/welcome/film';

  static Future<List<Movie_model>> getDataMovie() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<Movie_model> list = parseMovie(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Movie_model> parseMovie(String responseBody) {
    final parsed =
        json.decode(responseBody)['data'].cast<Map<String, dynamic>>();
    return parsed
        .map<Movie_model>((json) => Movie_model.fromJson(json))
        .toList();
  }
}
