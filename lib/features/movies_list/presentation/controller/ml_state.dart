part of 'ml_bloc.dart';

class MlState extends Equatable {
  final List<MovieModel> nowPlayingList;
  final List<MovieModel> popularList;
  final List<MovieModel> topRatedList;
  final List<MovieModel> upComingList;
  final int nowPlayingPage;
  final int popularPage;
  final int topRatedPage;
  final int upComingPage;
  final RequestState mlRequestState;

  const MlState(
      {this.nowPlayingList = const [],
      this.popularList = const [],
      this.topRatedList = const [],
      this.upComingList = const [],
      this.nowPlayingPage = 0,
      this.popularPage = 0,
      this.topRatedPage = 0,
      this.upComingPage = 0,
      this.mlRequestState = RequestState.loaded});

  MlState copyWith({
    List<MovieModel>? nowPlayingList,
    List<MovieModel>? popularList,
    List<MovieModel>? topRatedList,
    List<MovieModel>? upComingList,
    int? nowPlayingPage,
    int? popularPage,
    int? topRatedPage,
    int? upComingPage,
    RequestState? mlRequestState,
  }) {
    return MlState(
        nowPlayingList: nowPlayingList ?? this.nowPlayingList,
        popularList: popularList ?? this.popularList,
        topRatedList: topRatedList ?? this.topRatedList,
        upComingList: upComingList ?? this.upComingList,
        nowPlayingPage: nowPlayingPage ?? this.nowPlayingPage,
        popularPage: popularPage ?? this.popularPage,
        topRatedPage: topRatedPage ?? this.topRatedPage,
        upComingPage: upComingPage ?? this.upComingPage,
        mlRequestState: mlRequestState ?? this.mlRequestState);
  }

  @override
  List<Object> get props => [
        nowPlayingList,
        popularList,
        topRatedList,
        upComingList,
        nowPlayingPage,
        popularPage,
        topRatedPage,
        upComingPage,
        mlRequestState,
      ];
}
