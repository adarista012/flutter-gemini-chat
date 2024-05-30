import 'package:flutter/material.dart';
import 'package:flutter_vertex/app/ui/routes/app_routes.dart';
import 'package:flutter_vertex/app/ui/routes/routes.dart';
import 'package:flutter_meedu/ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Vertex Gemini',
      debugShowCheckedModeBanner: false,
      key: router.appKey,
      initialRoute: Routes.SPLASH,
      routes: appRoutes,
      navigatorKey: router.navigatorKey,
      navigatorObservers: [
        router.observer,
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurpleAccent,
        ),
        useMaterial3: true,
      ),
    );
  }
}
