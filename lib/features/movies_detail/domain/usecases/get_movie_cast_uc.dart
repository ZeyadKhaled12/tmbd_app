import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:tmbd_app/core/network/error/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../../data/models/movie_cast_model/movie_cast_model.dart';
import '../repository/base_md_repo.dart';

class GetMovieCastUc
    extends BaseUseCase<MovieCastModel, GetMovieCastParameters> {
  final BaseMdRepo baseMdRepo;

  GetMovieCastUc(this.baseMdRepo);

  @override
  Future<Either<Failure, MovieCastModel>> call(
      GetMovieCastParameters parameters) async {
    return await baseMdRepo.getMovieCast(parameters);
  }
}

class GetMovieCastParameters extends Equatable {
  final int movieID;
  const GetMovieCastParameters({required this.movieID});

  @override
  List<Object?> get props => [movieID];
}
