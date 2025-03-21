import 'package:dio/dio.dart';
import 'package:tmbd_app/features/movies_detail/data/datasource/md_local_datasource.dart';
import 'package:tmbd_app/features/movies_detail/data/models/movie_cast_model/movie_cast_model.dart';
import 'package:tmbd_app/features/movies_detail/data/models/movie_detail_model/movie_detail_model.dart';
import 'package:tmbd_app/features/movies_detail/domain/usecases/get_movie_cast_uc.dart';
import 'package:tmbd_app/features/movies_detail/domain/usecases/get_movie_detail_uc.dart';

import '../../../../core/network/error/error_message_model.dart';
import '../../../../core/network/error/exception.dart';
import '../../../../core/utils/app_api.dart';

abstract class BaseMdRemoteDatasource {
  Future<MovieDetailModel> getMoviesDetail(GetMovieDetailParameters parameters);
  Future<MovieCastModel> getMovieCast(GetMovieCastParameters parameters);
}

class MdRemoteDatasource extends BaseMdRemoteDatasource {
  @override
  Future<MovieDetailModel> getMoviesDetail(
      GetMovieDetailParameters parameters) async {
    Dio dio = Dio();
    final headers = {
      'Authorization': 'Bearer ${AppApi.token}',
      'accept': 'application/json',
    };
    final params = {
      'language': 'en-US',
    };
    final res = await dio.get(
      AppApi.getMovieDetail(parameters.movieID),
      queryParameters: params,
      options: Options(headers: headers),
    );
    if (res.statusCode == 200) {
      MovieDetailModel model = MovieDetailModel.fromJson(res.data);
      BaseMdLocalDatasource baseMdLocalDatasource = MdLocalDatasource();
      await baseMdLocalDatasource.setMovieDetail(model);
      return model;
    }
    throw ServerException(ErrorMessageModel.fromJson(res.data));
  }

  @override
  Future<MovieCastModel> getMovieCast(GetMovieCastParameters parameters) async {
    Dio dio = Dio();
    final headers = {
      'Authorization': 'Bearer ${AppApi.token}',
      'accept': 'application/json',
    };
    final res = await dio.get(
      AppApi.getMovieCast(parameters.movieID),
      options: Options(headers: headers),
    );
    if (res.statusCode == 200) {
      MovieCastModel model = MovieCastModel.fromJson(res.data);
      BaseMdLocalDatasource baseMdLocalDatasource = MdLocalDatasource();
      await baseMdLocalDatasource.setMovieCast(model);
      return MovieCastModel.fromJson(res.data);
    }
    throw ServerException(ErrorMessageModel.fromJson(res.data));
  }
}
