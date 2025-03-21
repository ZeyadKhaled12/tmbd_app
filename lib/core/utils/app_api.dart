class AppApi {
  static const baseUrl = 'https://api.themoviedb.org/3';
  static const baseImgUrl = 'https://image.tmdb.org/t/p/w500';
  static const token =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlNzE3Mjc3ZTc1Mzk1NjJmMzczYjM2NWE5YTlkZTdhMiIsIm5iZiI6MTY2OTE2Mjk1NC4wNzcsInN1YiI6IjYzN2Q2N2NhZmU2MzE4MDBlN2E0MjE0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.5gR9LqzLiXR0DCEmoVcjI4nsJIUd7ya9Vsnoao70Pis';

  static const getNowPlaying = '$baseUrl/movie/now_playing';
  static const getPopular = '$baseUrl/movie/popular';
  static const getTopRated = '$baseUrl/movie/top_rated';
  static const getUpcoming = '$baseUrl/movie/upcoming';
  static getMovieDetail(int id) => '$baseUrl/movie/$id';
  static getMovieCast(int id) => '$baseUrl/movie/$id/credits';
}
