import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:tmbd_app/core/network/error/failure.dart';
import 'package:tmbd_app/features/movies_detail/data/models/movie_detail_model/movie_detail_model.dart';

import '../../../../core/usecase/base_use_case.dart';
import '../repository/base_md_repo.dart';

class GetMovieDetailUc
    extends BaseUseCase<MovieDetailModel, GetMovieDetailParameters> {
  final BaseMdRepo baseMdRepo;

  GetMovieDetailUc(this.baseMdRepo);

  @override
  Future<Either<Failure, MovieDetailModel>> call(
      GetMovieDetailParameters parameters) async {
    return await baseMdRepo.getMovieDetail(parameters);
  }
}

class GetMovieDetailParameters extends Equatable {
  final int movieID;
  const GetMovieDetailParameters({required this.movieID});

  @override
  List<Object?> get props => [movieID];
}
