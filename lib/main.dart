import 'package:flutter/material.dart';
import 'package:flutter_testing/home_page.dart';

void main() {
  runApp(const FlutterTesting());
}

class FlutterTesting extends StatelessWidget {
  const FlutterTesting({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Testing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
