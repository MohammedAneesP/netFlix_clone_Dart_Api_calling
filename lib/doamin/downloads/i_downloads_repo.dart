//repository says that how many api calls will arriving

import 'package:dartz/dartz.dart';
import 'package:netflix_clone/doamin/core/failures/main_failure.dart';
import 'package:netflix_clone/doamin/downloads/models/model_download.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadImages();
  //either contain 2 part left and right in left side we write the failiure happen in api calling
  //right side success api calls will be listed
  // while calling the getdownloads the api will be call then it fetches the api response it mayh sucess it will put into Downloads section

}
