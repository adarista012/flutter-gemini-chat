import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_vertex/app/domain/repositories/firebase_vertexai_repository.dart';

class HomeController extends SimpleNotifier {
  final FirebaseVertexaiRepository firebaseVertexai;

  final TextEditingController _textToPromp = TextEditingController();
  TextEditingController get textToPromp => _textToPromp;

  final ScrollController _scrollController = ScrollController();
  ScrollController get scrollController => _scrollController;

  final List<({Image? image, String? text, bool fromUser})> _generatedContent =
      <({Image? image, String? text, bool fromUser})>[];
  List<({Image? image, String? text, bool fromUser})> get generatedContent =>
      _generatedContent;
  bool _loading = false;
  bool get loading => _loading;

  HomeController({required this.firebaseVertexai});

  void send() {
    if (_textToPromp.text.isNotEmpty) {
      _loading = true;
      _generatedContent.add(
        (
          image: null,
          text: _textToPromp.text,
          fromUser: true,
        ),
      );

      final prompt = Content.text(_textToPromp.text);

      streamChat(prompt);
      // final prompt = [Content.text(_textToPromp.text)];
      // streamContent(prompt);
      _textToPromp.clear();
      _scrollDown();
      notify();
    }
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  void streamContent(List<Content> prompt) async {
    firebaseVertexai.generateContent(prompt).listen(
      (chunk) {
        if (chunk.text!.isNotEmpty) {
          _generatedContent.add(
            (
              image: null,
              text: chunk.text,
              fromUser: false,
            ),
          );
          notify();
          _scrollDown();
        }
      },
    );
  }

  void streamChat(Content prompt) async {
    firebaseVertexai.generateChat(prompt).listen(
      (chunk) {
        if (chunk.text!.isNotEmpty) {
          _generatedContent.add(
            (
              image: null,
              text: chunk.text,
              fromUser: false,
            ),
          );
          notify();
          _scrollDown();
        }
      },
    );
  }
}
