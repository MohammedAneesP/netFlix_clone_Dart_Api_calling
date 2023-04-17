import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/doamin/core/failures/main_failure.dart';
import 'package:netflix_clone/doamin/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/doamin/downloads/models/model_download.dart';
import 'package:netflix_clone/doamin/search/search_service.dart';

import '../../doamin/search/model/search_respo/search_response.dart';


part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadService;
  final SearchService _searchService;

  SearchBloc(this._downloadService, this._searchService)
      : super(SearchState.initial()) {
/*
idle state
*/

    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(
          SearchState(
            searchResultList: [],
            idleList: state.idleList,
            loading: false,
            isError: false,
          ),
        );
        return;
      }
      emit(
        const SearchState(
          searchResultList: [],
          idleList: [],
          loading: true,
          isError: false,
        ),
      );

      // get trending
      final _result = await _downloadService.getDownloadImages();
      final _state = _result.fold((MainFailure f) {
        return const SearchState(
          searchResultList: [],
          idleList: [],
          loading: false,
          isError: true,
        );
      }, (List<Downloads> list) {
        return SearchState(
          searchResultList: [],
          idleList: list,
          loading: false,
          isError: false,
        );
      });
      // show to UI

      emit(_state);
    });

/*
Search Result State
*/

    on<SearchMovie>((event, emit) async {
      // call search movie api
      log('searching for ${event.movieQuery}');
      emit(
        const SearchState(
          searchResultList: [],
          idleList: [],
          loading: true,
          isError: false,
        ),
      );

      final _result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      final _state = _result.fold(
        (MainFailure f) {
           return const SearchState(
          searchResultList: [],
          idleList: [],
          loading: false,
          isError: true,
        );
        },
        (SearchResponse r) {
           return SearchState(
          searchResultList: r.results,
          idleList: [],
          loading: false,
          isError: false,
        );
        },
      );

      // show to ui
      emit(_state);
    });
  }
}
