import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmbd_app/core/utils/enums.dart';
import 'package:tmbd_app/features/movies_detail/presentation/controller/md_bloc.dart';
import 'package:tmbd_app/features/movies_detail/presentation/widgets/movie_detail_body.dart';

import '../../../../core/services/services_locator.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, required this.movieID});
  final int movieID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MdBloc>(),
      child: BlocBuilder<MdBloc, MdState>(
          buildWhen: (previous, current) =>
              previous.mdRequestState != current.mdRequestState ||
              previous.castRequestState != current.castRequestState,
          builder: (context, state) {
            return MovieDetailBody(
                movieDetailModel: state.movieDetailModel,
                movieCastModel: state.movieCastModel,
                movieID: movieID,
                isCastLoading: state.castRequestState == RequestState.loading,
                isLoading: state.mdRequestState == RequestState.loading ||
                    state.mdRequestState == RequestState.error);
          }),
    );
  }
}
