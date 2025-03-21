import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:tmbd_app/core/utils/enums.dart';

import '../../../../core/network/error/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../../data/models/movie_model.dart';
import '../repository/base_ml_repo.dart';

class GetLocalMoviesUc
    extends BaseUseCase<List<MovieModel>, GetLocalMoviesParameters> {
  final BaseMlRepo baseMlRepo;

  GetLocalMoviesUc(this.baseMlRepo);

  @override
  Future<Either<Failure, List<MovieModel>>> call(
      GetLocalMoviesParameters parameters) async {
    return await baseMlRepo.getLocalMovies(parameters);
  }
}

class GetLocalMoviesParameters extends Equatable {
  final Filters filters;
  const GetLocalMoviesParameters({required this.filters});

  @override
  List<Object?> get props => [filters];
}
