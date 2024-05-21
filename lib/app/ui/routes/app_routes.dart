import 'package:flutter/material.dart';
import 'package:flutter_vertex/app/ui/home/home_page.dart';
import 'package:flutter_vertex/app/ui/routes/routes.dart';
import 'package:flutter_vertex/app/ui/splash/splash_page.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  Routes.SPLASH: (_) => const SplashPage(),
  Routes.HOME: (_) => const HomePage(),
};
