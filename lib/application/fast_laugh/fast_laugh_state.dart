part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughState with _$FastLaughState {
  const factory FastLaughState({
   required List<Downloads> videoList,
    required List<int> likedVideoList,
    required bool isLoading,
    required bool isError,
  }) = _Initial;
  //pass the initial  value into bloc
  factory FastLaughState.initial() {
    return const FastLaughState(
      videoList: [],
      isLoading: true,
      isError: false,
      likedVideoList :  []
    );
  }
}
