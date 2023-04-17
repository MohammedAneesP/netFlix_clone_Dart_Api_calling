import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix_clone/application/home/home_bloc.dart';
import 'package:netflix_clone/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/main_page/screen_mian_bottom.dart';
import 'application/downloads/downloads_bloc.dart';
import 'application/search/search_bloc.dart';
import 'doamin/core/depend_injec/injectable.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) {
            return getIt<DownloadsBloc>();
          },
        ),
        BlocProvider(
          create: (ctx) {
            return getIt<SearchBloc>();
          },
        ),
        BlocProvider(
          create: (ctx) {
            return getIt<HotAndNewBloc>();
          },
        ),
        BlocProvider(
          create: (ctx) {
            return getIt<HomeBloc>();
          },
        ),
        BlocProvider(
          create: (ctx) {
            return getIt<FastLaughBloc>();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
          ),
          primarySwatch: Colors.blue,
          backgroundColor: Colors.black,
          scaffoldBackgroundColor: backgroundColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            bodyText2: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        home: ScreenMainPage(),
      ),
    );
  }
}
