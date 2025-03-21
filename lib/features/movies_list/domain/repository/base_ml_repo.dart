import 'package:either_dart/either.dart';
import 'package:tmbd_app/features/movies_list/data/models/movie_model.dart';
import 'package:tmbd_app/features/movies_list/domain/usecases/get_local_movies_uc.dart';
import 'package:tmbd_app/features/movies_list/domain/usecases/set_local_movies_uc.dart';

import '../../../../core/network/error/failure.dart';
import '../usecases/get_movies_list_uc.dart';

abstract class BaseMlRepo {
  Future<Either<Failure, List<MovieModel>>> getMoviesList(
      GetMoviesParameters parameters);
  Future<Either<Failure, void>> setLocalMovies(
      SetLocalMoviesParameters parameters);
  Future<Either<Failure, List<MovieModel>>> getLocalMovies(
      GetLocalMoviesParameters parameters);
}
