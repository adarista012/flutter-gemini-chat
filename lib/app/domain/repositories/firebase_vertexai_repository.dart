import 'package:firebase_vertexai/firebase_vertexai.dart';

abstract class FirebaseVertexaiRepository {
  Stream<GenerateContentResponse> generateContent(Iterable<Content> prompt);
  Stream<GenerateContentResponse> generateChat(Content prompt);
}
