import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_vertex/app/domain/repositories/firebase_vertexai_repository.dart';
import 'package:flutter_vertex/app/ui/home/home_controller.dart';

final homeProvider = SimpleProvider(
  (ref) => HomeController(
    firebaseVertexai: Get.find<FirebaseVertexaiRepository>(),
  ),
);
