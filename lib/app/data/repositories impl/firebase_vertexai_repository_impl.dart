import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter_vertex/app/data/providers/remote/firebase_provider.dart';
import 'package:flutter_vertex/app/domain/repositories/firebase_vertexai_repository.dart';

class FirebaseVertexaiRepositoryImpl extends FirebaseVertexaiRepository {
  final FirebaseProvider firebaseProvider;

  FirebaseVertexaiRepositoryImpl({required this.firebaseProvider});

  @override
  Stream<GenerateContentResponse> generateContent(Iterable<Content> prompt) =>
      firebaseProvider.generateContent(prompt);

  @override
  Stream<GenerateContentResponse> generateChat(Content prompt) =>
      firebaseProvider.generateChat(prompt);
}
