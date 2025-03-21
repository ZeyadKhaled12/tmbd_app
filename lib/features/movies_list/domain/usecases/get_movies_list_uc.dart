import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:tmbd_app/core/network/error/failure.dart';
import 'package:tmbd_app/core/utils/enums.dart';
import 'package:tmbd_app/features/movies_list/data/models/movie_model.dart';
import 'package:tmbd_app/features/movies_list/domain/repository/base_ml_repo.dart';

import '../../../../core/usecase/base_use_case.dart';

class GetMoviesListUc
    extends BaseUseCase<List<MovieModel>, GetMoviesParameters> {
  final BaseMlRepo baseMlRepo;

  GetMoviesListUc(this.baseMlRepo);

  @override
  Future<Either<Failure, List<MovieModel>>> call(
      GetMoviesParameters parameters) async {
    return await baseMlRepo.getMoviesList(parameters);
  }
}

class GetMoviesParameters extends Equatable {
  final int page;
  final Filters filters;
  const GetMoviesParameters({required this.page, required this.filters});

  @override
  List<Object?> get props => [page, filters];
}
