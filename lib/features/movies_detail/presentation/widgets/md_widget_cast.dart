import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmbd_app/configs/app_colors.dart';
import 'package:tmbd_app/core/utils/general_widgets/g_widget_loading.dart';
import 'package:tmbd_app/features/movies_detail/data/models/movie_cast_model/cast_model.dart';

class MdWidgetCast extends StatelessWidget {
  const MdWidgetCast({super.key, required this.cast, required this.isLoading});
  final List<CastModel> cast;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GWidgetLoading(
      isLoading: isLoading,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(top: 25)),
          Text('Cast',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w600)),
          Padding(padding: EdgeInsets.only(top: 22)),
          SizedBox(
            height: 135,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  cast.length,
                  (index) => Padding(
                        padding: EdgeInsets.only(right: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                height: 90,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: cast[index].profilePath == null
                                        ? null
                                        : DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                cast[index].profilePath!)),
                                    borderRadius: BorderRadius.circular(15)),
                                width: 90,
                                child: cast[index].profilePath == null
                                    ? Icon(Icons.person,
                                        color: AppColors.secondary, size: 40)
                                    : null),
                            Padding(padding: EdgeInsets.only(bottom: 8)),
                            Text(
                              cast[index].originalName ?? '',
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              cast[index].character ?? '',
                              style: GoogleFonts.inter(
                                  color: Colors.grey,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
