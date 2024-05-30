import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter_vertex/firebase_options.dart';

class FirebaseProvider {
  late final GenerativeModel model;
  late final ChatSession chat;

  FirebaseProvider() {
    initFirebase().then((value) {
      model = FirebaseVertexAI.instance.generativeModel(
        model: 'gemini-1.5-pro-preview-0409',
      );
      chat = model.startChat();
    });
  }

  Future<void> initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Stream<GenerateContentResponse> generateContent(
      Iterable<Content> prompt) async* {
    final response = model.generateContentStream(prompt);
    await for (final chunk in response) {
      yield chunk;
    }
  }

  Stream<GenerateContentResponse> generateChat(Content prompt) async* {
    final response = chat.sendMessageStream(prompt);
    await for (final chunk in response) {
      yield chunk;
    }
  }
}
