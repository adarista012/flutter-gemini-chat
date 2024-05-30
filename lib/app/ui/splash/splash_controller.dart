import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_vertex/app/ui/routes/routes.dart';

class SplashController extends SimpleNotifier {
  String? _routeName;
  String? get routeName => _routeName;

  SplashController() {
    _init();
  }

  void _init() async {
    await Future.delayed(const Duration(seconds: 3));
    _routeName = Routes.HOME;
    notify();
  }
}
