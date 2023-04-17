part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  factory HotAndNewState({
    required List<HotAndNewData> commingSoonList,
    required List<HotAndNewData> everyOneIsWatchingList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;
  factory HotAndNewState.initial() => HotAndNewState(
        commingSoonList: [],
        everyOneIsWatchingList: [],
        hasError: false,
        isLoading: false,
      );
}
