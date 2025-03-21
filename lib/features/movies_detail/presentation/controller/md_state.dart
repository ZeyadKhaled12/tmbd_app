part of 'md_bloc.dart';

class MdState extends Equatable {
  final MovieDetailModel movieDetailModel;
  final MovieCastModel movieCastModel;
  final RequestState castRequestState;
  final RequestState mdRequestState;

  const MdState(
      {this.movieDetailModel = const MovieDetailModel(),
      this.movieCastModel = const MovieCastModel(),
      this.castRequestState = RequestState.loaded,
      this.mdRequestState = RequestState.loaded});

  MdState copyWith({
    MovieDetailModel? movieDetailModel,
    MovieCastModel? movieCastModel,
    RequestState? castRequestState,
    RequestState? mdRequestState,
  }) {
    return MdState(
        movieDetailModel: movieDetailModel ?? this.movieDetailModel,
        movieCastModel: movieCastModel ?? this.movieCastModel,
        castRequestState: castRequestState ?? this.castRequestState,
        mdRequestState: mdRequestState ?? this.mdRequestState);
  }

  @override
  List<Object> get props =>
      [movieDetailModel, movieCastModel, castRequestState, mdRequestState];
}
