import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:tmbd_app/features/movies_detail/data/models/movie_cast_model/movie_cast_model.dart';
import 'package:tmbd_app/features/movies_detail/data/models/movie_detail_model/movie_detail_model.dart';
import 'package:tmbd_app/features/movies_detail/domain/usecases/get_local_cast_uc.dart';

import '../../../../app/app.dart';
import '../../../../core/network/error/error_message_model.dart';
import '../../../../core/network/error/exception.dart';
import '../../domain/usecases/get_local_md_uc.dart';

abstract class BaseMdLocalDatasource {
  //cache movie detail
  Future<void> setMovieDetail(MovieDetailModel parameters);
  Future<MovieDetailModel> getMovieDetail(GetLocalMdParameters parameters);

  //cache cast movie
  Future<void> setMovieCast(MovieCastModel parameters);
  Future<MovieCastModel> getMovieCast(GetLocalCastParameters parameters);
}

class MdLocalDatasource extends BaseMdLocalDatasource {
  @override
  Future<MovieDetailModel> getMovieDetail(
      GetLocalMdParameters parameters) async {
    var box = Hive.box(App.localDataRef);
    final Map data = await box.get('movieDetail');
    if (data.containsKey(parameters.movieID)) {
      return MovieDetailModel.fromJson(
          jsonDecode((data[parameters.movieID] as String)));
    }
    throw ServerException(ErrorMessageModel(statusMessage: ''));
  }

  @override
  Future<void> setMovieDetail(MovieDetailModel parameters) async {
    try {
      var box = Hive.box(App.localDataRef);
      final Map data =
          box.containsKey('movieDetail') ? await box.get('movieDetail') : {};
      data[parameters.id] = jsonEncode(parameters.toJson());
      await box.put('movieDetail', data);
    } catch (e) {
      throw ServerException(ErrorMessageModel(statusMessage: '$e'));
    }
  }

  @override
  Future<MovieCastModel> getMovieCast(GetLocalCastParameters parameters) async {
    var box = Hive.box(App.localDataRef);
    final Map data = await box.get('movieCast');
    if (data.containsKey(parameters.movieID)) {
      return MovieCastModel.fromJson(
          jsonDecode((data[parameters.movieID] as String)));
    }
    throw ServerException(ErrorMessageModel(statusMessage: ''));
  }

  @override
  Future<void> setMovieCast(MovieCastModel parameters) async{
      try {
      var box = Hive.box(App.localDataRef);
      final Map data =
          box.containsKey('movieCast') ? await box.get('movieCast') : {};
      data[parameters.id] = jsonEncode(parameters.toJson());
      await box.put('movieCast', data);
    } catch (e) {
      throw ServerException(ErrorMessageModel(statusMessage: '$e'));
    }
  }
}
