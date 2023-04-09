import 'package:netflix_clone/core/strings.dart';
import 'package:netflix_clone/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = "$kBaseUrl/trending/all/day?api_key=$ApiKey";
  static const search = '$kBaseUrl/search/movie?api_key=$ApiKey';
}
