import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmbd_app/features/movies_detail/data/models/movie_cast_model/movie_cast_model.dart';
import 'package:tmbd_app/features/movies_detail/data/models/movie_detail_model/movie_detail_model.dart';
import 'package:tmbd_app/features/movies_detail/domain/usecases/get_local_cast_uc.dart';
import 'package:tmbd_app/features/movies_detail/domain/usecases/get_local_md_uc.dart';
import 'package:tmbd_app/features/movies_detail/domain/usecases/get_movie_cast_uc.dart';
import 'package:tmbd_app/features/movies_detail/domain/usecases/get_movie_detail_uc.dart';

import '../../../../core/utils/enums.dart';

part 'md_event.dart';
part 'md_state.dart';

class MdBloc extends Bloc<MdEvent, MdState> {
  final GetMovieDetailUc getMovieDetailUc;
  final GetMovieCastUc getMovieCastUc;
  final GetLocalMdUc getLocalMdUc;
  final GetLocalCastUc getLocalCastUc;
  MdBloc(this.getMovieDetailUc, this.getMovieCastUc, this.getLocalMdUc, this.getLocalCastUc)
      : super(MdState()) {
    on<GetMovieDetailEvent>(_getMovieDetail);
    on<GetMovieCastEvent>(_getMovieCast);
    on<GetLocalMdEvent>(_getLocalMd);
    on<GetLocalCastEvent>(_getLocalCast);
  }

  FutureOr<void> _getMovieDetail(
      GetMovieDetailEvent event, Emitter<MdState> emit) async {
    emit(state.copyWith(mdRequestState: RequestState.loading));
    final result = await getMovieDetailUc.call(event.getMovieDetailParameters);
    result.fold((l) => emit(state.copyWith(mdRequestState: RequestState.error)),
        (r) {
      emit(state.copyWith(
          mdRequestState: RequestState.loaded, movieDetailModel: r));
    });
  }

  FutureOr<void> _getMovieCast(
      GetMovieCastEvent event, Emitter<MdState> emit) async {
    emit(state.copyWith(castRequestState: RequestState.loading));
    final result = await getMovieCastUc.call(event.getMovieCastParameters);
    result.fold(
        (l) => emit(state.copyWith(castRequestState: RequestState.error)), (r) {
      emit(state.copyWith(
          castRequestState: RequestState.loaded, movieCastModel: r));
    });
  }

  FutureOr<void> _getLocalMd(
      GetLocalMdEvent event, Emitter<MdState> emit) async {
    emit(state.copyWith(mdRequestState: RequestState.loading));
    final result = await getLocalMdUc.call(event.getLocalMdParameters);
    result.fold((l) => emit(state.copyWith(mdRequestState: RequestState.error)),
        (r) {
      emit(state.copyWith(
          mdRequestState: RequestState.loaded, movieDetailModel: r));
    });
  }

   FutureOr<void> _getLocalCast(
      GetLocalCastEvent event, Emitter<MdState> emit) async {
    emit(state.copyWith(castRequestState: RequestState.loading));
    final result = await getLocalCastUc.call(event.getLocalCastParameters);
    result.fold(
        (l) => emit(state.copyWith(castRequestState: RequestState.error)), (r) {
      emit(state.copyWith(
          castRequestState: RequestState.loaded, movieCastModel: r));
    });
  }
}
