import 'package:flutter/material.dart';
import 'package:tmbd_app/configs/app_colors.dart';
import 'package:tmbd_app/core/utils/assets_manager.dart';
import 'package:tmbd_app/core/utils/general_widgets/g_widget_animation_opacity.dart';
import 'package:tmbd_app/features/movies_list/presentation/screens/movies_list_screen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: GWidgetAnimationOpacity(
            widgetOpacity: Image.asset(
              ImgAsset.logo,
              width: 90,
              height: 90,
            ),
            seconds: 2,
            onEnd: () {
              Future.delayed(Duration(seconds: 2), () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MoviesListScreen()));
              });
            }),
      ),
    );
  }
}
