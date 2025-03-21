import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GWidgetSnackBar {
  final String body;
  final bool isSucess;
  final BuildContext context;

  GWidgetSnackBar(
      {required this.body, required this.isSucess, required this.context});

  Future showSnackBar() async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      padding: const EdgeInsets.all(10),
      elevation: 1,
      backgroundColor: isSucess ? const Color(0XFF197232) : Colors.red[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.down,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(isSucess ? 'Success' : 'Error',
              style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 15)),
          const Padding(padding: EdgeInsets.only(bottom: 8)),
          Text(body,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12,
              ))
        ],
      ),
    ));
  }
}
