import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:tmbd_app/features/movies_list/data/models/movie_model.dart';

import '../../../../core/network/error/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../../../../core/utils/enums.dart';
import '../repository/base_ml_repo.dart';

class SetLocalMoviesUc
    extends BaseUseCase<void, SetLocalMoviesParameters> {
  final BaseMlRepo baseMlRepo;

  SetLocalMoviesUc(this.baseMlRepo);

  @override
  Future<Either<Failure, void>> call(
      SetLocalMoviesParameters parameters) async {
    return await baseMlRepo.setLocalMovies(parameters);
  }
}

class SetLocalMoviesParameters extends Equatable {
  final List<MovieModel> list;
  final Filters filters;
  const SetLocalMoviesParameters({required this.list, required this.filters});

  @override
  List<Object?> get props => [list, filters];
}
