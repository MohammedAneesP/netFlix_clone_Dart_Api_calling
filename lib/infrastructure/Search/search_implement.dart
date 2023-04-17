import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/doamin/core/failures/main_failure.dart';
import 'package:netflix_clone/doamin/search/search_service.dart';


import '../../doamin/core/api_end_points.dart';
import '../../doamin/search/model/search_respo/search_response.dart';

@LazySingleton(as: SearchService)
class SearchImpl implements SearchService {
  @override
  Future<Either<MainFailure, SearchResponse>> searchMovies(
      {required String movieQuery}) async {
    try {
      final Response response = await Dio(BaseOptions()).get(
          ApiEndPoints.search,
          queryParameters: {'query': movieQuery}); //key value
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResponse.fromJson(response.data);
        log(response.data.toString());
        return Right(result);

        //if the response is true we loop the model and add the all response into list and that list will show pictures
      } else {
        log(response.data);
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
