import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/doamin/core/failures/main_failure.dart';
import 'package:netflix_clone/doamin/hot_new/hot_and_new_services.dart';

import '../../doamin/hot_new/model/hot_and_new_resp/hot_and_new_resp.dart';

part 'hot_and_new_event.dart';
part 'hot_and_new_state.dart';
part 'hot_and_new_bloc.freezed.dart';

@injectable
class HotAndNewBloc extends Bloc<HotAndNewEvent, HotAndNewState> {
  final HotAndNewService _hotAndNewService;

  HotAndNewBloc(this._hotAndNewService) : super(HotAndNewState.initial()) {
    //get hot and movie data
    on<LoadDataInCommingSoon>((event, emit) async {
      //send loading to the ui
      emit(HotAndNewState(
        commingSoonList: [],
        everyOneIsWatchingList: [],
        isLoading: true,
        hasError: false,
      ));
      //data from remote
      final _result = await _hotAndNewService.getHotAndNewMovieData();

      //data to stae
      final newState = _result.fold(
        (MainFailure failure) {
          return HotAndNewState(
              commingSoonList: [],
              everyOneIsWatchingList: [],
              isLoading: false,
              hasError: true);
        },
        (HotAndNewResp resp) {
          return HotAndNewState(
              commingSoonList: resp.results,
              everyOneIsWatchingList: state.everyOneIsWatchingList,
              isLoading: false,
              hasError: false);
        },
      );
      //returning the state into ui
      emit(newState);
    });

    on<LoadDataInEveryonesWatching>((event, emit) async {
      emit(HotAndNewState(
        commingSoonList: [],
        everyOneIsWatchingList: [],
        isLoading: true,
        hasError: false,
      ));
      //data from remote
      final _result = await _hotAndNewService.getHotAndNewTvData();

      //data to stae
      final newState = _result.fold(
        (MainFailure failure) {
          return HotAndNewState(
              commingSoonList: [],
              everyOneIsWatchingList: [],
              isLoading: false,
              hasError: true);
        },
        (HotAndNewResp resp) {
          return HotAndNewState(
              commingSoonList: state.commingSoonList,
              everyOneIsWatchingList: resp.results,
              isLoading: false,
              hasError: false);
        },
      );
      //returning the state into ui
      emit(newState);
    });
  }
}
