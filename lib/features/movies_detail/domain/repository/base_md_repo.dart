import 'package:either_dart/either.dart';
import 'package:tmbd_app/features/movies_detail/data/models/movie_cast_model/movie_cast_model.dart';
import 'package:tmbd_app/features/movies_detail/data/models/movie_detail_model/movie_detail_model.dart';
import 'package:tmbd_app/features/movies_detail/domain/usecases/get_local_cast_uc.dart';
import 'package:tmbd_app/features/movies_detail/domain/usecases/get_movie_cast_uc.dart';

import '../../../../core/network/error/failure.dart';
import '../usecases/get_local_md_uc.dart';
import '../usecases/get_movie_detail_uc.dart';

abstract class BaseMdRepo {
  Future<Either<Failure, MovieDetailModel>> getMovieDetail(
      GetMovieDetailParameters parameters);
  Future<Either<Failure, MovieCastModel>> getMovieCast(
      GetMovieCastParameters parameters);
  Future<Either<Failure, MovieDetailModel>> getLocalMd(
      GetLocalMdParameters parameters);
  Future<Either<Failure, MovieCastModel>> getLocalCast(
      GetLocalCastParameters parameters);
}
