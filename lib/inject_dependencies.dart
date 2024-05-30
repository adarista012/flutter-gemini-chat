import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_vertex/app/data/providers/remote/firebase_provider.dart';
import 'package:flutter_vertex/app/data/repositories%20impl/firebase_vertexai_repository_impl.dart';
import 'package:flutter_vertex/app/domain/repositories/firebase_vertexai_repository.dart';

Future<void> injectDependencies() async {
  final firebase = FirebaseProvider();
  Get.lazyPut<FirebaseVertexaiRepository>(
    () => FirebaseVertexaiRepositoryImpl(firebaseProvider: firebase),
  );
}
