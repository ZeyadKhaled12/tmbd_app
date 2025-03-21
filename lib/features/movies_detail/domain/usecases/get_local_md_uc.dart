import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:tmbd_app/features/movies_detail/data/models/movie_detail_model/movie_detail_model.dart';

import '../../../../core/network/error/failure.dart';
import '../../../../core/usecase/base_use_case.dart';
import '../repository/base_md_repo.dart';

class GetLocalMdUc
    extends BaseUseCase<MovieDetailModel, GetLocalMdParameters> {
  final BaseMdRepo baseMdRepo;

  GetLocalMdUc(this.baseMdRepo);

  @override
  Future<Either<Failure, MovieDetailModel>> call(
      GetLocalMdParameters parameters) async {
    return await baseMdRepo.getLocalMd(parameters);
  }
}

class GetLocalMdParameters extends Equatable {
  final int movieID;
  const GetLocalMdParameters({required this.movieID});

  @override
  List<Object?> get props => [movieID];
}
