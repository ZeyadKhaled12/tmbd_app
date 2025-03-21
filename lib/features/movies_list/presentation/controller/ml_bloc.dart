import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmbd_app/features/movies_list/data/models/movie_model.dart';
import 'package:tmbd_app/features/movies_list/domain/usecases/get_local_movies_uc.dart';
import 'package:tmbd_app/features/movies_list/domain/usecases/get_movies_list_uc.dart';

import '../../../../core/utils/enums.dart';

part 'ml_event.dart';
part 'ml_state.dart';

class MlBloc extends Bloc<MlEvent, MlState> {
  final GetMoviesListUc getMoviesListUc;
  final GetLocalMoviesUc getLocalMoviesUc;
  MlBloc(this.getMoviesListUc, this.getLocalMoviesUc) : super(MlState()) {
    on<GetMoviesListEvent>(_getMoviesList);
    on<GetLocalMoviesEvent>(_getLocalMovies);
  }

  FutureOr<void> _getMoviesList(
      GetMoviesListEvent event, Emitter<MlState> emit) async {
    emit(state.copyWith(mlRequestState: RequestState.loading));
    final result = await getMoviesListUc.call(event.getMoviesParameters);
    result.fold((l) => emit(state.copyWith(mlRequestState: RequestState.error)),
        (r) {
      switch (event.getMoviesParameters.filters) {
        case Filters.popular:
          List<MovieModel> list = List.from(state.popularList);
          list.addAll(r);
          emit(state.copyWith(
              popularPage: event.getMoviesParameters.page,
              mlRequestState: RequestState.loaded,
              popularList: list));
        case Filters.nowPlaying:
          List<MovieModel> list = List.from(state.nowPlayingList);
          list.addAll(r);
          emit(state.copyWith(
              nowPlayingPage: event.getMoviesParameters.page,
              mlRequestState: RequestState.loaded,
              nowPlayingList: list));
        case Filters.topRated:
          List<MovieModel> list = List.from(state.topRatedList);
          list.addAll(r);
          emit(state.copyWith(
              topRatedPage: event.getMoviesParameters.page,
              mlRequestState: RequestState.loaded,
              topRatedList: list));
        case Filters.upComing:
          List<MovieModel> list = List.from(state.upComingList);
          list.addAll(r);
          emit(state.copyWith(
              upComingPage: event.getMoviesParameters.page,
              mlRequestState: RequestState.loaded,
              upComingList: list));
      }
    });
  }

  FutureOr<void> _getLocalMovies(
      GetLocalMoviesEvent event, Emitter<MlState> emit) async {
    emit(state.copyWith(mlRequestState: RequestState.loading));
    final result = await getLocalMoviesUc.call(event.getLocalMoviesParameters);
    result.fold((l) => emit(state.copyWith(mlRequestState: RequestState.error)),
        (r) {
      switch (event.getLocalMoviesParameters.filters) {
        case Filters.popular:
          emit(state.copyWith(
              mlRequestState: RequestState.loaded, popularList: r));
        case Filters.nowPlaying:
          emit(state.copyWith(
              mlRequestState: RequestState.loaded, nowPlayingList: r));
        case Filters.topRated:
          emit(state.copyWith(
              mlRequestState: RequestState.loaded, topRatedList: r));
        case Filters.upComing:
          emit(state.copyWith(
              mlRequestState: RequestState.loaded, upComingList: r));
      }
    });
  }
}
