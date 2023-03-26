import 'dart:io';

import 'package:crimson/crimson.dart';
import 'package:example_code/markdown_text.dart';
import 'package:example_code/model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  saveMarkdownText(String text) async {
    final content = Content(detail: text);
    content.detail = content.toBase64();
    final writer = CrimsonWriter();
    writer.writeContent(content);
    final filename = await FilePicker.platform.saveFile(
        fileName: 'test.json',
        type: FileType.custom,
        allowedExtensions: ['json']);
    if (filename != null) {
      File(filename).writeAsBytesSync(writer.toBytes(), flush: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SelectionArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                    onPressed: () async {
                      await saveMarkdownText(simpleMarkdwonText);
                    },
                    child: const Text('Simple markdown text to json file')),
                const Text(
                  simpleMarkdwonText,
                ),
                TextButton(
                    onPressed: () async {
                      //The file saved here will trigger the bug
                      await saveMarkdownText(complexMarkdwonText);
                    },
                    child: const Text('Complex markdown text to json file')),
                const Text(
                  complexMarkdwonText,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
