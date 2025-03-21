import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../configs/app_colors.dart';

class MlWidgetFilters extends StatelessWidget {
  const MlWidgetFilters(
      {super.key, required this.indexFilter, required this.onFilterChanged});
  final int indexFilter;
  final Function(int index) onFilterChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Filters',
          style: GoogleFonts.poppins(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Padding(padding: EdgeInsets.only(bottom: 25)),
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CardFilter(
                  text: 'Populr',
                  isClick: indexFilter == 0,
                  onPressed: () {
                    onFilterChanged(0);
                  }),
              CardFilter(
                  text: 'Now Playing',
                  isClick: indexFilter == 1,
                  onPressed: () {
                    onFilterChanged(1);
                  }),
              CardFilter(
                  text: 'Top Rated',
                  isClick: indexFilter == 2,
                  onPressed: () {
                    onFilterChanged(2);
                  }),
              CardFilter(
                  text: 'UpComing',
                  isClick: indexFilter == 3,
                  onPressed: () {
                    onFilterChanged(3);
                  })
            ],
          ),
        )
      ],
    );
  }
}

class CardFilter extends StatelessWidget {
  const CardFilter(
      {super.key,
      required this.text,
      required this.isClick,
      required this.onPressed});
  final String text;
  final bool isClick;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: isClick ? AppColors.secondary : Colors.transparent,
              borderRadius: BorderRadius.circular(14)),
          child: Text(
            text,
            style: GoogleFonts.poppins(
                color: isClick ? Colors.white : Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
