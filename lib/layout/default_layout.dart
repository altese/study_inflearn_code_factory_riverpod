import 'package:flutter/material.dart';

class DefaulLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;

  const DefaulLayout({
    super.key,
    required this.title,
    required this.body,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: actions,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: body,
      ),
    );
  }
}
