import 'package:flutter/material.dart';
import 'package:flutter_vertex/app/app.dart';
import 'package:flutter_vertex/inject_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  runApp(const App());
}
