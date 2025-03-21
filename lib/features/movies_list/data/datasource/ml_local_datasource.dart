import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:tmbd_app/app/app.dart';
import 'package:tmbd_app/core/utils/enums.dart';
import 'package:tmbd_app/features/movies_list/data/models/movie_model.dart';
import 'package:tmbd_app/features/movies_list/domain/usecases/get_local_movies_uc.dart';

import '../../../../core/network/error/error_message_model.dart';
import '../../../../core/network/error/exception.dart';
import '../../domain/usecases/set_local_movies_uc.dart';

abstract class BaseMlLocalDatasource {
  Future<void> setMoviesList(SetLocalMoviesParameters parameters);
  Future<List<MovieModel>> getLocalMovies(GetLocalMoviesParameters parameters);
}

class MlLocalDatasource extends BaseMlLocalDatasource {
  @override
  Future<void> setMoviesList(SetLocalMoviesParameters parameters) async {
    var box = Hive.box(App.localDataRef);
    try {
      switch (parameters.filters) {
        case Filters.popular:
          await box.put('popular',
              parameters.list.map((e) => jsonEncode(e.toJson())).toList());
        case Filters.nowPlaying:
          await box.put('nowPlaying',
              parameters.list.map((e) => jsonEncode(e.toJson())).toList());
        case Filters.topRated:
          await box.put('topRated',
              parameters.list.map((e) => jsonEncode(e.toJson())).toList());
        case Filters.upComing:
          await box.put('upComing',
              parameters.list.map((e) => jsonEncode(e.toJson())).toList());
      }
    } catch (e) {
      throw ServerException(ErrorMessageModel(statusMessage: '$e'));
    }
  }

  @override
  Future<List<MovieModel>> getLocalMovies(
      GetLocalMoviesParameters parameters) async {
    var box = Hive.box(App.localDataRef);
    try {
      switch (parameters.filters) {
        case Filters.popular:
          return (await (box.get('popular')) as List)
              .map((e) => MovieModel.fromJson(jsonDecode(e)))
              .toList();
        case Filters.nowPlaying:
          return (await (box.get('nowPlaying')) as List)
              .map((e) => MovieModel.fromJson(jsonDecode(e)))
              .toList();
        case Filters.topRated:
          return (await (box.get('topRated')) as List)
              .map((e) => MovieModel.fromJson(jsonDecode(e)))
              .toList();
        case Filters.upComing:
          return (await (box.get('upComing')) as List)
              .map((e) => MovieModel.fromJson(jsonDecode(e)))
              .toList();
      }
    } catch (e) {
      throw ServerException(ErrorMessageModel(statusMessage: '$e'));
    }
  }
}
