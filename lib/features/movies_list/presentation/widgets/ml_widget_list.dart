import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmbd_app/configs/app_colors.dart';
import 'package:tmbd_app/core/utils/assets_manager.dart';
import 'package:tmbd_app/core/utils/general_widgets/g_widget_loading.dart';
import 'package:tmbd_app/features/movies_detail/presentation/screens/movie_detail_screen.dart';
import 'package:tmbd_app/features/movies_list/data/models/movie_model.dart';

import '../../../../core/utils/general_widgets/g_widget_loading_circle.dart';

class MlWidgetList extends StatefulWidget {
  const MlWidgetList(
      {super.key,
      required this.onEnd,
      required this.moviesList,
      required this.isLoading});
  final Function() onEnd;
  final bool isLoading;
  final List<MovieModel> moviesList;

  @override
  State<MlWidgetList> createState() => _MlWidgetListState();
}

class _MlWidgetListState extends State<MlWidgetList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        log('GET HERE');
        widget.onEnd();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GWidgetLoading(
        isLoading: widget.isLoading && widget.moviesList.isEmpty,
        body: GridView.builder(
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.64,
          ),
          itemCount: widget.moviesList.length + 2,
          itemBuilder: (context, index) {
            if (index >= widget.moviesList.length) {
              if (!(widget.isLoading && widget.moviesList.isEmpty)) {
                return const Center(
                    child: GWidgetLoadingCircle(
                  color: AppColors.secondary,
                ));
              }
              return SizedBox();
            }
            return InkWell(
              onTap: () async => await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailScreen(
                        movieID: widget.moviesList[index].id!),
                  )),
              child: Padding(
                padding: EdgeInsets.only(left: 5, right: 5, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: widget.moviesList[index].posterPath == null
                                  ? null
                                  : DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(widget
                                          .moviesList[index].posterPath!)),
                              color: Colors.white),
                          margin: EdgeInsets.only(bottom: 6),
                          child: widget.moviesList[index].posterPath == null
                              ? Center(
                                  child: Image.asset(
                                    ImgAsset.logo,
                                    width: 45,
                                    height: 45,
                                  ),
                                )
                              : null),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          (widget.moviesList[index].title?.length ?? 0) > 16
                              ? '${widget.moviesList[index].title!.substring(0, 16)}...'
                              : widget.moviesList[index].title ?? '',
                          overflow: TextOverflow.clip,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        Text(
                          widget.moviesList[index].releaseDate ?? '',
                          style: GoogleFonts.poppins(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
