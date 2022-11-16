import 'dart:async';

import 'package:flutter/material.dart';

import 'package:kfx_flutter/extensions/extensions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return MaterialApp(
      title: "DateTime Extensions - Relative Time",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _ExampleCard(title: "Time until christmas", date: DateTime(now.year, 12, 25)),
                const SizedBox(width: 16, height: 16),
                _ExampleCard(title: "My age", date: DateTime(1977, 1, 26)),
                const SizedBox(width: 16, height: 16),
                StreamBuilder(
                  stream: Stream.periodic(const Duration(seconds: 30), (_) => now.toRelativeString()),
                  initialData: now.toRelativeString(),
                  builder: (context, asyncSnapshot) => _ExampleCard(title: "Widget built", text: asyncSnapshot.data!),
                ),
                const SizedBox(width: 16, height: 16),
                _ExampleCard(title: "Flying cars", date: DateTime(2015, 10, 21)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ExampleCard extends StatelessWidget {
  const _ExampleCard({required this.title, this.date, this.text});

  final String title;
  final DateTime? date;
  final String? text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: theme.textTheme.titleMedium),
            Text(text ?? date!.toRelativeString(), style: theme.textTheme.labelMedium, textAlign: TextAlign.right),
          ],
        ),
      ),
    );
  }
}
