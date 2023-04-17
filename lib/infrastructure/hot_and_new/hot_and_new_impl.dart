import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:dartz/dartz.dart';
import 'package:netflix_clone/doamin/hot_new/hot_and_new_services.dart';
import 'package:netflix_clone/doamin/hot_new/model/hot_and_new_resp/hot_and_new_resp.dart';


import '../../doamin/core/api_end_points.dart';
import '../../doamin/core/failures/main_failure.dart';
import '../../doamin/search/model/search_respo/search_response.dart';

@LazySingleton(as: HotAndNewService)//if we call the hot and bew service the object of Hotandnewimplementation object will be return from here
class HotAndNewImplementation implements HotAndNewService {
  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewMovie,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
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

  @override
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData() async {
    try {
      final Response response = await Dio(BaseOptions()).get(
        ApiEndPoints.hotAndNewTv,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = HotAndNewResp.fromJson(response.data);
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
