import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmbd_app/features/movies_detail/data/models/movie_cast_model/movie_cast_model.dart';
import 'package:tmbd_app/features/movies_detail/presentation/widgets/md_widget_cast.dart';

import '../../data/models/movie_detail_model/movie_detail_model.dart';

class MdWidgetRate extends StatelessWidget {
  const MdWidgetRate(
      {super.key,
      required this.movieDetailModel,
      required this.movieCastModel, required this.isLoading});
  final MovieDetailModel movieDetailModel;
  final MovieCastModel movieCastModel;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    double rate = (movieDetailModel.voteAverage) ?? 0;
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.amberAccent),
                child: Text(
                  'TMDB',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: EdgeInsets.only(right: 19)),
              Icon(
                Icons.star,
                color: Colors.amberAccent,
                size: 24,
              ),
              Padding(padding: EdgeInsets.only(right: 6)),
              Text(rate.toStringAsFixed(1),
                  style: TextStyle(
                      color: Colors.amberAccent,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
              Padding(padding: EdgeInsets.only(right: 12)),
              Text('${movieDetailModel.releaseDate?.substring(0, 4)}',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w400))
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Text(movieDetailModel.title ?? '',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          Padding(padding: EdgeInsets.only(top: 15)),
          SizedBox(
            height: 36,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    movieDetailModel.genres?.length ?? 0,
                    (index) => Container(
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(9),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.24),
                              borderRadius: BorderRadius.circular(25)),
                          child: Text('${movieDetailModel.genres?[index].name}',
                              style: GoogleFonts.poppins(
                                  color: Colors.white, fontSize: 12)),
                        ))),
          ),
          Padding(padding: EdgeInsets.only(top: 25)),
          Text(movieDetailModel.overview ?? '',
              style: GoogleFonts.poppins(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 12,
                  fontWeight: FontWeight.w400)),
          MdWidgetCast(cast: movieCastModel.cast ?? [], isLoading: isLoading),
          Padding(padding: EdgeInsets.only(bottom: 22)),
        ],
      ),
    );
  }
}
