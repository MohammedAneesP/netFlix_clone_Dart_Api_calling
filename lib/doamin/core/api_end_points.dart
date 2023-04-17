
import '../../core/constants.dart';
import '../../infrastructure/api_key.dart';

class ApiEndPoints {
  static const download = '$baseUrl/trending/all/day?api_key=$apiKey';
  static const search = '$baseUrl/search/movie?api_key=$apiKey';
  //hot and new
  static const hotAndNewMovie = '$baseUrl/discover/movie?api_key=$apiKey';
  static const hotAndNewTv = '$baseUrl/discover/tv?api_key=$apiKey';
}