import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_vertexai/firebase_vertexai.dart';
import 'package:flutter/services.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Vertex Ai',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Vertex Ai'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() async {
    // setState(() {
    //   // This call to setState tells the Flutter framework that something has
    //   // changed in this State, which causes it to rerun the build method below
    //   // so that the display can reflect the updated values. If we changed
    //   // _counter without calling setState(), then the build method would not be
    //   // called again, and so nothing would appear to happen.
    //   _counter++;
    // });\final prompt = [Content.text('Write a story about a magic backpack.')];

    // Gemini 1.5 Pro is versatile and can accept both text-only and multimodal prompt inputs
    final model = FirebaseVertexAI.instance
        .generativeModel(model: 'gemini-1.5-pro-preview-0409');
/*
    final prompt = TextPart("What's in the picture?");
// Prepare images for input

    ByteData catBytes = await rootBundle.load('images/image0.jpg');
    final imagePart = DataPart('image/jpeg', catBytes.buffer.asUint8List());

// To stream generated text output, call generateContentStream with the text and image
    final response = await model.generateContentStream([
      Content.multi([prompt, imagePart])
    ]);
    await for (final chunk in response) {
      print(chunk.text);
    }

    */

    final chat = model.startChat();
// Provide a prompt that contains text
    final prompt = Content.text('Write a story about a magic backpack.');

    final response = await chat.sendMessageStream(prompt);
    await for (final chunk in response) {
      print(chunk.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
