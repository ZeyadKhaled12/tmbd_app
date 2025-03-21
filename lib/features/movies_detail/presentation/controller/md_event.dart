part of 'md_bloc.dart';

class MdEvent extends Equatable {
  const MdEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailEvent extends MdEvent {
  final GetMovieDetailParameters getMovieDetailParameters;

  const GetMovieDetailEvent({required this.getMovieDetailParameters});
  @override
  List<Object> get props => [getMovieDetailParameters];
}

class GetMovieCastEvent extends MdEvent {
  final GetMovieCastParameters getMovieCastParameters;

  const GetMovieCastEvent({required this.getMovieCastParameters});
  @override
  List<Object> get props => [getMovieCastParameters];
}


class GetLocalMdEvent extends MdEvent {
  final GetLocalMdParameters getLocalMdParameters;

  const GetLocalMdEvent({required this.getLocalMdParameters});
  @override
  List<Object> get props => [getLocalMdParameters];
}

class GetLocalCastEvent extends MdEvent {
  final GetLocalCastParameters getLocalCastParameters;

  const GetLocalCastEvent({required this.getLocalCastParameters});
  @override
  List<Object> get props => [getLocalCastParameters];
}

