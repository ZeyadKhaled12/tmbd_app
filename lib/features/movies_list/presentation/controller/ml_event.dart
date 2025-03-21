part of 'ml_bloc.dart';

class MlEvent extends Equatable {
  const MlEvent();

  @override
  List<Object> get props => [];
}

class GetMoviesListEvent extends MlEvent {
  final GetMoviesParameters getMoviesParameters;

  const GetMoviesListEvent({required this.getMoviesParameters});
  @override
  List<Object> get props => [getMoviesParameters];
}

class GetLocalMoviesEvent extends MlEvent {
  final GetLocalMoviesParameters getLocalMoviesParameters;

  const GetLocalMoviesEvent({required this.getLocalMoviesParameters});
  @override
  List<Object> get props => [getLocalMoviesParameters];
}
