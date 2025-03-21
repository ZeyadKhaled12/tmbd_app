import 'package:either_dart/either.dart';
import 'package:tmbd_app/core/network/error/failure.dart';
import 'package:tmbd_app/features/movies_list/data/datasource/ml_local_datasource.dart';
import 'package:tmbd_app/features/movies_list/data/datasource/ml_remote_datasource.dart';
import 'package:tmbd_app/features/movies_list/data/models/movie_model.dart';
import 'package:tmbd_app/features/movies_list/domain/repository/base_ml_repo.dart';
import 'package:tmbd_app/features/movies_list/domain/usecases/get_local_movies_uc.dart';
import 'package:tmbd_app/features/movies_list/domain/usecases/get_movies_list_uc.dart';
import 'package:tmbd_app/features/movies_list/domain/usecases/set_local_movies_uc.dart';

import '../../../../core/network/error/exception.dart';

class MlRepo extends BaseMlRepo {
  final BaseMlRemoteDatasource baseMlRemoteDatasource;
  final BaseMlLocalDatasource baseMlLocalDatasource;

  MlRepo(this.baseMlRemoteDatasource, this.baseMlLocalDatasource);

  @override
  Future<Either<Failure, List<MovieModel>>> getMoviesList(
      GetMoviesParameters parameters) async {
    try {
      final result = await baseMlRemoteDatasource.getMoviesList(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, void>> setLocalMovies(
      SetLocalMoviesParameters parameters) async {
    try {
      final result = await baseMlLocalDatasource.setMoviesList(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<MovieModel>>> getLocalMovies(
      GetLocalMoviesParameters parameters) async {
    try {
      final result = await baseMlLocalDatasource.getLocalMovies(parameters);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
