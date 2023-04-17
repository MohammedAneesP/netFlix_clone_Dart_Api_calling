import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/search/search_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/search_idle.dart';

import '../../doamin/core/debouncer/debouncer.dart';
import 'widgets/search_result.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});
  final _debouncer = Debouncer(milliseconds: 1 * 1000);

  @override
  Widget build(BuildContext context) {
    //it will call after the ui building
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              backgroundColor: searchBackColor,
              prefixIcon: searchPrefixStyle,
              suffixIcon: searchSuffixStyle,
              style: searchTextStyle,
              onChanged: (value) {
                _debouncer.run(() {
                  BlocProvider.of<SearchBloc>(context).add(
                    SearchMovie(movieQuery: value),
                  );
                });
              },
            ),
            kHeight,
            Expanded(child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state.searchResultList.isEmpty) {
                  return const SearchIdleWidget();
                } else {
                  return const SearchResultWidget();
                }
              },
            ))
          ],
        ),
      )),
    );
  }
}
