part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required List<SearchResultData> searchResultList,
    required List<Downloads> idleList,
    required bool loading,
    required bool isError,
  }) = _SearchState;

  factory SearchState.initial() => const SearchState(
        searchResultList: [],
        idleList: [],
        loading: false,
        isError: false,
      );
}
