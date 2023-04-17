part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateId,
    required List<HotAndNewData> pastYearMoveList,
    required List<HotAndNewData> trendingMovieList,
    required List<HotAndNewData> tenseDramasMoveList,
    required List<HotAndNewData> sounthIndianMoveList,
    required List<HotAndNewData> trendingTvList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;
  factory HomeState.initial() {
    return const HomeState(
      stateId: '0',
      pastYearMoveList: [],
      trendingMovieList: [],
      tenseDramasMoveList: [],
      sounthIndianMoveList: [],
      trendingTvList: [],
      isLoading: false,
      hasError: false,
    );
  }
}
