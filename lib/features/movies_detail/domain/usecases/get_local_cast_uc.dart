import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:tmbd_app/features/movies_detail/data/models/movie_cast_model/movie_cast_model.dart';

import '../../../../core/network/error/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../repository/base_md_repo.dart';

class GetLocalCastUc extends BaseUseCase<MovieCastModel, GetLocalCastParameters> {
  final BaseMdRepo baseMdRepo;

  GetLocalCastUc(this.baseMdRepo);

  @override
  Future<Either<Failure, MovieCastModel>> call(
      GetLocalCastParameters parameters) async {
    return await baseMdRepo.getLocalCast(parameters);
  }
}

class GetLocalCastParameters extends Equatable {
  final int movieID;
  const GetLocalCastParameters({required this.movieID});

  @override
  List<Object?> get props => [movieID];
}
