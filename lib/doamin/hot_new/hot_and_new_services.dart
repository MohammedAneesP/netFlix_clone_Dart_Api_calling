import 'package:dartz/dartz.dart';
import 'package:netflix_clone/doamin/core/failures/main_failure.dart';

import 'model/hot_and_new_resp/hot_and_new_resp.dart';


abstract class HotAndNewService {
  Future<Either<MainFailure, HotAndNewResp>> getHotAndNewMovieData();
   Future<Either<MainFailure, HotAndNewResp>> getHotAndNewTvData();
}
