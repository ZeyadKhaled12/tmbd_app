import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmbd_app/app/app.dart';
import 'package:tmbd_app/core/utils/general_widgets/g_widget_loading.dart';
import 'package:tmbd_app/features/movies_detail/data/models/movie_cast_model/movie_cast_model.dart';
import 'package:tmbd_app/features/movies_detail/domain/usecases/get_local_cast_uc.dart';
import 'package:tmbd_app/features/movies_detail/domain/usecases/get_local_md_uc.dart';
import 'package:tmbd_app/features/movies_detail/domain/usecases/get_movie_cast_uc.dart';
import 'package:tmbd_app/features/movies_detail/domain/usecases/get_movie_detail_uc.dart';
import 'package:tmbd_app/features/movies_detail/presentation/controller/md_bloc.dart';
import 'package:tmbd_app/features/movies_detail/presentation/widgets/md_widget_rate.dart';
import 'package:tmbd_app/features/movies_detail/presentation/widgets/md_widget_cover.dart';

import '../../../../configs/app_colors.dart';
import '../../data/models/movie_detail_model/movie_detail_model.dart';

class MovieDetailBody extends StatefulWidget {
  const MovieDetailBody(
      {super.key,
      required this.movieDetailModel,
      required this.isLoading,
      required this.movieID,
      required this.movieCastModel,
      required this.isCastLoading});
  final MovieDetailModel movieDetailModel;
  final MovieCastModel movieCastModel;
  final int movieID;
  final bool isCastLoading;
  final bool isLoading;

  @override
  State<MovieDetailBody> createState() => _MovieDetailBodyState();
}

class _MovieDetailBodyState extends State<MovieDetailBody> {

  void _listenToConnection() {
    Connectivity().onConnectivityChanged.listen((result) {
      log('message: ${result.last}');
      setState(() {
        App.isOnline = (result.last != ConnectivityResult.none);
      });
      _getData();
    });
  }

  void _getData() {
    if (!App.isOnline) {
      context.read<MdBloc>().add(GetLocalMdEvent(
          getLocalMdParameters: GetLocalMdParameters(movieID: widget.movieID)));
            context.read<MdBloc>().add(GetLocalCastEvent(
          getLocalCastParameters:
              GetLocalCastParameters(movieID: widget.movieID)));
      return;
    }
    context.read<MdBloc>().add(GetMovieDetailEvent(
        getMovieDetailParameters:
            GetMovieDetailParameters(movieID: widget.movieID)));
    context.read<MdBloc>().add(GetMovieCastEvent(
        getMovieCastParameters:
            GetMovieCastParameters(movieID: widget.movieID)));
  }

  @override
  void initState() {
    _getData();
    _listenToConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(backgroundColor: AppColors.primary)),
      backgroundColor: AppColors.primary,
      body: GWidgetLoading(
        isLoading: widget.isLoading,
        body: Column(
          children: [
            MdWidgetCover(movieDetailModel: widget.movieDetailModel),
            Expanded(
                child: MdWidgetRate(
              movieDetailModel: widget.movieDetailModel,
              movieCastModel: widget.movieCastModel,
              isLoading: widget.isCastLoading,
            ))
          ],
        ),
      ),
    );
  }
}
