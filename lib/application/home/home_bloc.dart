import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/doamin/core/failures/main_failure.dart';
import 'package:netflix_clone/doamin/hot_new/hot_and_new_services.dart';
import 'package:netflix_clone/doamin/hot_new/model/hot_and_new_resp/hot_and_new_resp.dart';



part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService homeService; 
  //getting the data from service through _homeservice object
  HomeBloc(this.homeService) : super(HomeState.initial()) {
    //super(HomeState.initial()) it should be the first state
    //on event get homescreen data
    on<GetHomeScreenData>((event, emit) async {
     // log('Data');
      //send loading to the UI
      emit(state.copyWith(
        isLoading: true,
        hasError: true,
      ));
      //get data
      final movieResult = await homeService.getHotAndNewMovieData();
      final tvResult = await homeService.getHotAndNewTvData();

      //transform data

      final state1 = movieResult.fold(
        (MainFailure failure) {
          return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMoveList: [],
            trendingMovieList: [],
            tenseDramasMoveList: [],
            sounthIndianMoveList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewResp resp) {
          final pastYear = resp.results;
          final trending = resp.results;
          final dramas = resp.results;
          final southIndian = resp.results;
          // final tvList = resp.results;
          pastYear.shuffle();
          trending.shuffle();
          dramas.shuffle();
          southIndian.shuffle();
          // tvList.shuffle();

          return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMoveList: pastYear,
            trendingMovieList: trending,
            tenseDramasMoveList: dramas,
            sounthIndianMoveList: southIndian,
            trendingTvList: state.trendingMovieList,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(state1);

      final state2 = tvResult.fold(
        (MainFailure failure) {
          return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMoveList: [],
            trendingMovieList: [],
            tenseDramasMoveList: [],
            sounthIndianMoveList: [],
            trendingTvList: [],
            isLoading: false,
            hasError: true,
          );
        },
        (HotAndNewResp resp) {
          final top10List = resp.results;
          return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMoveList: state.pastYearMoveList,
            trendingMovieList: state.trendingMovieList,
            tenseDramasMoveList: state.tenseDramasMoveList,
            sounthIndianMoveList: state.sounthIndianMoveList,
            trendingTvList: top10List,
            isLoading: false,
            hasError: false,
          );
        },
      );
      emit(state2);

      //send to UI
    });
  }
}
