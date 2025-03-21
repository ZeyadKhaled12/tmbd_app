import 'package:flutter/material.dart';
import 'package:tmbd_app/core/utils/assets_manager.dart';

import '../../../../configs/app_colors.dart';
import '../../data/models/movie_detail_model/movie_detail_model.dart';

class MdWidgetCover extends StatelessWidget {
  const MdWidgetCover({super.key, required this.movieDetailModel});
  final MovieDetailModel movieDetailModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
          image: movieDetailModel.posterPath == null
              ? DecorationImage(
                  image: AssetImage(ImgAsset.logo),
                )
              : DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(movieDetailModel.posterPath!))),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    stops: [0.4, 2],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, AppColors.primary])),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ),
          // Center(
          //   child: CircleAvatar(
          //     radius: 30,
          //     backgroundColor: AppColors.secondary.withOpacity(0.65),
          //     child: Icon(Icons.play_arrow, color: Colors.white, size: 25),
          //   ),
          // )
        ],
      ),
    );
  }
}
