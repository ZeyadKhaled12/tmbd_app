import 'package:flutter/material.dart';
import 'package:tmbd_app/features/splash.dart';
import 'app/app.dart';
import 'core/services/services_locator.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  await Hive.initFlutter();
  await Hive.openBox(App.localDataRef);
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: App.navigatorKey,
      
        title: 'Movie App', debugShowCheckedModeBanner: false, home: Splash());
  }
}
