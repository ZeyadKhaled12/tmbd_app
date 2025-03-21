import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmbd_app/features/movies_list/data/models/movie_model.dart';
import 'package:tmbd_app/features/movies_list/domain/usecases/get_local_movies_uc.dart';
import 'package:tmbd_app/features/movies_list/domain/usecases/get_movies_list_uc.dart';
import 'package:tmbd_app/features/movies_list/presentation/controller/ml_bloc.dart';

import '../../../../app/app.dart';
import '../../../../configs/app_colors.dart';
import '../../../../core/utils/enums.dart';
import 'ml_widget_filters.dart';
import 'ml_widget_list.dart';

class MoviesListBody extends StatefulWidget {
  const MoviesListBody(
      {super.key,
      required this.popular,
      required this.nowPlaying,
      required this.topRated,
      required this.upComing,
      required this.isLoading});
  final List<MovieModel> popular;
  final List<MovieModel> nowPlaying;
  final List<MovieModel> topRated;
  final List<MovieModel> upComing;
  final bool isLoading;

  @override
  State<MoviesListBody> createState() => _MoviesListBodyState();
}

class _MoviesListBodyState extends State<MoviesListBody> {
  int indexFilter = 0;

  final List<String> filters = [
    'Popular',
    'Now Playing',
    'Top Rated',
    'UpComing'
  ];

  void _listenToConnection() {
    Connectivity().onConnectivityChanged.listen((result) {
      setState(() {
        App.isOnline = (result.last != ConnectivityResult.none);
      });
      _getData();
    });
  }

  @override
  void initState() {
    _listenToConnection();
    super.initState();
  }

  void _getData() {
    if (!App.isOnline) {
      context.read<MlBloc>().add(GetLocalMoviesEvent(
          getLocalMoviesParameters: GetLocalMoviesParameters(
              filters: (indexFilter == 0)
                  ? Filters.popular
                  : indexFilter == 1
                      ? Filters.nowPlaying
                      : indexFilter == 2
                          ? Filters.topRated
                          : Filters.upComing)));
      return;
    }
    if (indexFilter == 0) {
      context.read<MlBloc>().add(GetMoviesListEvent(
          getMoviesParameters: GetMoviesParameters(
              page: context.read<MlBloc>().state.popularPage + 1,
              filters: Filters.popular)));
    } else if (indexFilter == 1) {
      context.read<MlBloc>().add(GetMoviesListEvent(
          getMoviesParameters: GetMoviesParameters(
              page: context.read<MlBloc>().state.nowPlayingPage + 1,
              filters: Filters.nowPlaying)));
    } else if (indexFilter == 2) {
      context.read<MlBloc>().add(GetMoviesListEvent(
          getMoviesParameters: GetMoviesParameters(
              page: context.read<MlBloc>().state.topRatedPage + 1,
              filters: Filters.topRated)));
    } else {
      context.read<MlBloc>().add(GetMoviesListEvent(
          getMoviesParameters: GetMoviesParameters(
              page: context.read<MlBloc>().state.upComingPage + 1,
              filters: Filters.upComing)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      //appBar: PreferredSize(preferredSize: Sized, child: child)
      body: Container(
        margin: EdgeInsets.all(19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 40)),
            MlWidgetFilters(
                indexFilter: indexFilter,
                onFilterChanged: (index) {
                  setState(() {
                    indexFilter = index;
                  });
                  bool check = (indexFilter == 0 && widget.popular.isEmpty) ||
                      (indexFilter == 1 && widget.nowPlaying.isEmpty) ||
                      (indexFilter == 2 && widget.topRated.isEmpty) ||
                      (indexFilter == 3 && widget.upComing.isEmpty);
                  if (check) {
                    _getData();
                  }
                }),
            Padding(padding: EdgeInsets.only(bottom: 29)),
            Text(
              filters[indexFilter],
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400),
            ),
            Padding(padding: EdgeInsets.only(bottom: 24)),
            Expanded(
                child: MlWidgetList(
                    onEnd: () {
                      _getData();
                    },
                    isLoading: widget.isLoading,
                    moviesList: indexFilter == 0
                        ? widget.popular
                        : indexFilter == 1
                            ? widget.nowPlaying
                            : indexFilter == 2
                                ? widget.topRated
                                : widget.upComing))
          ],
        ),
      ),
    );
  }
}
