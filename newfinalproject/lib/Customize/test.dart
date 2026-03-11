import 'package:flutter/material.dart';

class test extends StatefulWidget {
  final String name;
  final String author;
  final String path;
  const test({required this.path,required this.name, required this.author});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
