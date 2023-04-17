import 'package:dartz/dartz.dart';
import 'package:netflix_clone/doamin/core/failures/main_failure.dart';
import 'model/search_respo/search_response.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchResponse>> searchMovies({
    required String movieQuery,
  });
}
