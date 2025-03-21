import 'package:either_dart/either.dart';
import 'package:tmbd_app/core/network/error/failure.dart';
import 'package:tmbd_app/features/movies_detail/data/datasource/md_local_datasource.dart';
import 'package:tmbd_app/features/movies_detail/data/datasource/md_remote_datasource.dart';
import 'package:tmbd_app/features/movies_detail/data/models/movie_cast_model/movie_cast_model.dart';
import 'package:tmbd_app/features/movies_detail/data/models/movie_detail_model/movie_detail_model.dart';
import 'package:tmbd_app/features/movies_detail/domain/repository/base_md_repo.dart';
import 'package:tmbd_app/features/movies_detail/domain/usecases/get_local_cast_uc.dart';
import 'package:tmbd_app/features/movies_detail/domain/usecases/get_local_md_uc.dart';
import 'package:tmbd_app/features/movies_detail/domain/usecases/get_movie_cast_uc.dart';
import 'package:tmbd_app/features/movies_detail/domain/usecases/get_movie_detail_uc.dart';

import '../../../../core/network/error/exception.dart';

class MdRepo extends BaseMdRepo {
  final BaseMdRemoteDatasource baseMdRemoteDatasource;
  final BaseMdLocalDatasource baseMdLocalDatasource;

  MdRepo(this.baseMdRemoteDatasource, this.baseMdLocalDatasource);

  @override
  Future<Either<Failure, MovieDetailModel>> getMovieDetail(
      GetMovieDetailParameters parameters) async {
    try {
      final result = await baseMdRemoteDatasource.getMoviesDetail(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieCastModel>> getMovieCast(
      GetMovieCastParameters parameters) async {
    try {
      final result = await baseMdRemoteDatasource.getMovieCast(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetailModel>> getLocalMd(
      GetLocalMdParameters parameters) async {
    try {
      final result = await baseMdLocalDatasource.getMovieDetail(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieCastModel>> getLocalCast(GetLocalCastParameters parameters) async{
    try {
      final result = await baseMdLocalDatasource.getMovieCast(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
