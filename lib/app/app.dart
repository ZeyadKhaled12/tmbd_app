import 'package:flutter/material.dart';
import '../core/utils/general_widgets/g_widget_snackbar.dart';

class App {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static bool isOnline = false;

  static Future snackBar(
          {required String body, required bool isSucess}) async =>
      await GWidgetSnackBar(
              body: body,
              isSucess: isSucess,
              context: navigatorKey.currentState!.context)
          .showSnackBar();

  static const String localDataRef = 'movie_box';
}
