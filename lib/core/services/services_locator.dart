import 'package:get_it/get_it.dart';
import 'package:tmbd_app/features/movies_detail/data/datasource/md_local_datasource.dart';
import 'package:tmbd_app/features/movies_detail/data/datasource/md_remote_datasource.dart';
import 'package:tmbd_app/features/movies_detail/data/repository/md_repo.dart';
import 'package:tmbd_app/features/movies_detail/domain/repository/base_md_repo.dart';
import 'package:tmbd_app/features/movies_detail/domain/usecases/get_local_cast_uc.dart';
import 'package:tmbd_app/features/movies_detail/domain/usecases/get_local_md_uc.dart';
import 'package:tmbd_app/features/movies_detail/domain/usecases/get_movie_cast_uc.dart';
import 'package:tmbd_app/features/movies_detail/domain/usecases/get_movie_detail_uc.dart';
import 'package:tmbd_app/features/movies_detail/presentation/controller/md_bloc.dart';
import 'package:tmbd_app/features/movies_list/data/datasource/ml_local_datasource.dart';
import 'package:tmbd_app/features/movies_list/data/datasource/ml_remote_datasource.dart';
import 'package:tmbd_app/features/movies_list/data/repository/ml_repo.dart';
import 'package:tmbd_app/features/movies_list/domain/repository/base_ml_repo.dart';
import 'package:tmbd_app/features/movies_list/domain/usecases/get_local_movies_uc.dart';
import 'package:tmbd_app/features/movies_list/domain/usecases/get_movies_list_uc.dart';
import 'package:tmbd_app/features/movies_list/domain/usecases/set_local_movies_uc.dart';
import 'package:tmbd_app/features/movies_list/presentation/controller/ml_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //Bloc
    sl.registerFactory(() => MlBloc(sl(), sl()));
    sl.registerFactory(() => MdBloc(sl(), sl(), sl(), sl()));

    //movies list usecases
    sl.registerLazySingleton(() => GetMoviesListUc(sl()));
    sl.registerLazySingleton(() => SetLocalMoviesUc(sl()));
    sl.registerLazySingleton(() => GetLocalMoviesUc(sl()));

    //movies detail usecases
    sl.registerLazySingleton(() => GetMovieDetailUc(sl()));
    sl.registerLazySingleton(() => GetMovieCastUc(sl()));
    sl.registerLazySingleton(() => GetLocalMdUc(sl()));
     sl.registerLazySingleton(() => GetLocalCastUc(sl()));
    

    //Repo
    sl.registerLazySingleton<BaseMlRepo>(() => MlRepo(sl(), sl()));
    sl.registerLazySingleton<BaseMdRepo>(() => MdRepo(sl(), sl()));

    //Data Source
    sl.registerLazySingleton<BaseMlRemoteDatasource>(
        () => MlRemoteDatasource());
    sl.registerLazySingleton<BaseMlLocalDatasource>(() => MlLocalDatasource());
    sl.registerLazySingleton<BaseMdRemoteDatasource>(
        () => MdRemoteDatasource());
    sl.registerLazySingleton<BaseMdLocalDatasource>(
        () => MdLocalDatasource());
  }
}
