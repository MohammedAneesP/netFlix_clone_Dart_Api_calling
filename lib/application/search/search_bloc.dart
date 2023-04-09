import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';
import 'package:netflix_clone/domain/search/search_service.dart';

import '../../domain/search/models/search_response/search_response.dart';

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
      emit(
       const SearchState(
          searchResultList: [],
          idleList: [],
          loading: true,
          isError: false,
        ),
      );

      // get trending
      final _result = await _downloadService.getDownloadsImages();
      final state =  _result.fold((MainFailure f) {
    
        return  const SearchState(
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

      emit(state);
    });

/*
Search Result State
*/

    on<SearchMovie>((event, emit) {
      // call search movie api
      _searchService.searchMovies(
        movieQuery: event.movieQuery,
      );
      // show to ui
    });
  }
}
