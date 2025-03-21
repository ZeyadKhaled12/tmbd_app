import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmbd_app/core/utils/enums.dart';
import 'package:tmbd_app/features/movies_list/presentation/controller/ml_bloc.dart';
import 'package:tmbd_app/features/movies_list/presentation/widgets/movies_list_body.dart';

import '../../../../core/services/services_locator.dart';

class MoviesListScreen extends StatelessWidget {
  const MoviesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MlBloc>(),
      child: BlocBuilder<MlBloc, MlState>(
          buildWhen: (previous, current) =>
              previous.mlRequestState != current.mlRequestState,
          builder: (context, state) {
            return MoviesListBody(
                isLoading: state.mlRequestState == RequestState.loading,
                popular: state.popularList,
                nowPlaying: state.nowPlayingList,
                topRated: state.topRatedList,
                upComing: state.upComingList);
          }),
    );
  }
}
