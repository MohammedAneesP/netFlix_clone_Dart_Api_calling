import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/doamin/downloads/i_downloads_repo.dart';


import '../../doamin/downloads/models/model_download.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
];

@injectable
//through injectable we can get the implementation of IDownloadRepo
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadsRepo _downloadService,
  ) : super(FastLaughState.initial()) {
    //comming initial event from bloc event
    on<Initialize>((event, emit) async {
      //for loading on the ui
      emit(const FastLaughState(
          videoList: [], isLoading: true, isError: false, likedVideoList: []));
      //firstly we need to get the trending images
      final _result = await _downloadService.getDownloadImages();
      final _stae = _result.fold((l) {
        return FastLaughState(
            videoList: [],
            isLoading: false,
            isError: true,
            likedVideoList: state.likedVideoList);
      }, (resp) {
        return FastLaughState(
            videoList: resp,
            isLoading: false,
            isError: false,
            likedVideoList: state.likedVideoList);
      });

      //then we need to add the video into the ui
      emit(_stae);
    });
    on<LikeVideo>((event, emit) async {
       state.likedVideoList.add(event.id);
      emit(state.copyWith(likedVideoList:state.likedVideoList));
    });
    on<UnlikeVideo>((event, emit) async{
       state.likedVideoList.remove(event.id);
      emit(state.copyWith(likedVideoList:state.likedVideoList));
    });
  }
}
