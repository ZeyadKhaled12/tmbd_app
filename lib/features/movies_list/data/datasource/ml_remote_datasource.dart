import 'package:dio/dio.dart';
import 'package:tmbd_app/core/utils/app_api.dart';
import 'package:tmbd_app/core/utils/enums.dart';
import 'package:tmbd_app/features/movies_list/data/models/movie_model.dart';
import 'package:tmbd_app/features/movies_list/domain/usecases/get_movies_list_uc.dart';
import 'package:tmbd_app/features/movies_list/domain/usecases/set_local_movies_uc.dart';

import '../../../../core/network/error/error_message_model.dart';
import '../../../../core/network/error/exception.dart';
import 'ml_local_datasource.dart';

abstract class BaseMlRemoteDatasource {
  Future<List<MovieModel>> getMoviesList(GetMoviesParameters parameters);
}

class MlRemoteDatasource extends BaseMlRemoteDatasource {
  @override
  Future<List<MovieModel>> getMoviesList(GetMoviesParameters parameters) async {
    Dio dio = Dio();
    final headers = {
      'Authorization': 'Bearer ${AppApi.token}',
      'accept': 'application/json',
    };
    final params = {
      'language': 'en-US',
      'page': parameters.page.toString(),
    };
    String url;
    switch (parameters.filters) {
      case Filters.popular:
        url = AppApi.getPopular;
      case Filters.nowPlaying:
        url = AppApi.getNowPlaying;
      case Filters.topRated:
        url = AppApi.getTopRated;
      case Filters.upComing:
        url = AppApi.getUpcoming;
    }
    final res = await dio.get(
      url,
      queryParameters: params,
      options: Options(headers: headers),
    );
    if (res.statusCode == 200) {
      List<MovieModel> list = (res.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
      BaseMlLocalDatasource baseMlRemoteDatasource = MlLocalDatasource();
      await baseMlRemoteDatasource.setMoviesList(
          SetLocalMoviesParameters(list: list, filters: parameters.filters));
      return list;
    }
    throw ServerException(
        ErrorMessageModel.fromJson(res.data));
  }
}
